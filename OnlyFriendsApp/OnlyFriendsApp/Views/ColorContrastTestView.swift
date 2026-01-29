//
//  ColorContrastFlowView.swift
//  OnlyFriendsApp
//
//  Created by Dawar Hasnain on 28/01/26.
//


import SwiftUI

struct ColorContrastTestView: View {

    let eye: EyeType
    let onFinish: (ColorContrastResult) -> Void
    
    @State private var testManager = ColorContrastTestManager()
    @State private var feedback: FeedbackState? = nil
    @State private var testFinished = false
    @State private var showAlert = false
    @State private var displayManager = DisplayManager()

    enum FeedbackState {
        case correct
        case incorrect
    }

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Header
            VStack(spacing: 6) {
                Text("Color Contrast")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Testing \(eye.rawValue)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("Cover your other eye and tap the matching gap below.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)

                Text("Tap the direction of the gap")
                    .font(.body)
                    .foregroundColor(.gray)
            }

            Spacer()

            // MARK: - Stimulus + Feedback
            VStack(spacing: 20) {

                SmallLandoltCContrastView(
                    rotationAngle: testManager.rotationManager.rotationAngle,
                    size: testManager.currentSize,
                    contrast: testManager.currentContrast
                )

                Text(
                    feedback == .correct
                    ? "Correct"
                    : (feedback == .incorrect ? "Incorrect" : " ")
                )
                .font(.headline)
                .foregroundColor(feedback == .correct ? .green : .red)
                .opacity(feedback == nil ? 0 : 1)
                .frame(height: 24)
            }

            Spacer()

            // MARK: - Clickable Ring
            ClickableRingView(
                onSegmentTap: { tappedIndex in
                    handleTap(tappedIndex)
                },
                questionIndex: testManager.attemptCount
            )
            .disabled(testFinished)
            .opacity(testFinished ? 0.5 : 1)

            Spacer()

            // MARK: - Next Button
            VStack {
                Button(action: {
                    let result = ColorContrastResult(
                        numerator: testManager.finalNumerator ?? 0,
                        attemptsUsed: testManager.attemptCount
                    )
                    onFinish(result)
                }) {
                    Text("Next")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .buttonStyle(.plain)
                .opacity(testFinished ? 1 : 0)
                .disabled(!testFinished)
            }
            .padding(.horizontal, 40)
            .frame(height: 80)
            .padding(.bottom, 20)
        }
        .padding()
        .onAppear {
            testManager.startTest()
        }
        .navigationBarBackButtonHidden(true)
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

    // MARK: - Tap Handling
    private func handleTap(_ tappedIndex: Int) {

        let isCorrect = testManager.registerAnswer(tappedIndex: tappedIndex)

        withAnimation(.easeIn(duration: 0.2)) {
            feedback = isCorrect ? .correct : .incorrect
        }

        if testManager.isTestFinished {
            withAnimation(.spring()) {
                testFinished = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            feedback = nil
        }
    }
}
