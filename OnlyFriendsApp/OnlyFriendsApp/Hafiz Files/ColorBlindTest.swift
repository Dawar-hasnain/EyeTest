//
//  ColorBlindTest.swift
//  EyeTest
//
//  Created by Hafiz Rahmadhani on 25/01/26.
//
import SwiftUI

struct ColorBlindPlate {
    let imageName: String
    let options: [String]
    let correctAnswer: String
}

struct ColorBlindTest: View {
    //@Binding var isNavigationActive: Bool
    
    @State private var currentIndex = 0
    @State private var correctAnswersCount = 0
    @State private var navigateToSummary = false
    @State private var showAlert = false
    @State private var selectedOption: String? = nil
    @State private var isProcessing = false
    @State private var displayManager = DisplayManager()
    
    @Environment(\.dismiss) private var dismiss
    
    let plates: [ColorBlindPlate] = [
        ColorBlindPlate(imageName: "Ishihara12", options: ["69", "40", "12", "Nothing"], correctAnswer: "12"),
        ColorBlindPlate(imageName: "Ishihara29", options: ["70", "29", "91", "Nothing"], correctAnswer: "29"),
        ColorBlindPlate(imageName: "Ishihara15", options: ["48", "15", "17", "Nothing"], correctAnswer: "15"),
        ColorBlindPlate(imageName: "Ishihara6", options: ["6", "49", "98", "Nothing"], correctAnswer: "6"),
        ColorBlindPlate(imageName: "Ishihara5", options: ["75", "2", "5", "Nothing"], correctAnswer: "5"),
        ColorBlindPlate(imageName: "IshiharaNothing", options: ["27", "45", "97", "Nothing"], correctAnswer: "Nothing")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ProgressView(value: Double(currentIndex), total: Double(plates.count))
                .padding(.horizontal, 40)
                .padding(.top, 10)
            
            Text("\(currentIndex + 1) of \(plates.count)")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("Select the number you see in the circle.")
                .fontWeight(.medium)
            
            Spacer()
            
            if currentIndex < plates.count {
                Image(plates[currentIndex].imageName)
                    .resizable()
                    .renderingMode(.original) // Agar warna SVG tidak berubah
                    .scaledToFit()
                    .frame(width: 280, height: 280)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.1), radius: 10)
            }
            
            Spacer()
            
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    optionButton(at: 0)
                    optionButton(at: 1)
                }
                HStack(spacing: 12) {
                    optionButton(at: 2)
                    optionButton(at: 3)
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 40)
        }
        //.navigationTitle("Color Blind Test")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToSummary) {
            SummaryColorBlind(
                totalCorrect: correctAnswersCount,
                totalQuestions: plates.count,
                onDone: {
                    dismiss()
                }
                //isNavigationActive: $isNavigationActive
            )
        }
        .task {
            displayManager.lockMaxBrightness()
            showAlert = true
        }
        .onDisappear {
            displayManager.restoreSettings()
        }
        .alert("Important Setup", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Step 1: Brightness has been set to Max. \nPlease manually turn off 'True Tone' in Control Center for accurate results.\n\nStep 2: Holding a phone of approximately 20cm from your eyes would give you nearly accurate results.")
                .multilineTextAlignment(.center)
        }
    }
    
    @ViewBuilder
    private func optionButton(at index: Int) -> some View {
        let option = plates[currentIndex].options[index]
        let isCorrect = option == plates[currentIndex].correctAnswer
        let isSelected = selectedOption == option
        
        Button(action: {
            if !isProcessing { handleAnswer(option) }
        }) {
            HStack {
                Text(option)
                    .font(.headline)
                if isSelected {
                    Spacer()
                    Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                }
            }
            .foregroundColor(isSelected ? .white : .primary)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .padding(.horizontal)
            .background(isSelected ? (isCorrect ? Color.green : Color.red) : Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.clear : Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
        .disabled(isProcessing)
    }
    
    private func handleAnswer(_ selected: String) {
        selectedOption = selected
        isProcessing = true
        
        if selected == plates[currentIndex].correctAnswer {
            correctAnswersCount += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            if currentIndex < plates.count - 1 {
                withAnimation {
                    currentIndex += 1
                    selectedOption = nil
                    isProcessing = false
                }
            } else {
                navigateToSummary = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        ColorBlindTest()
    }
}
