import SwiftUI

struct VisualAcuityTestView: View {
    
    let eye: EyeType
    let onFinish: (VisualAcuityResult) -> Void
    
    @State private var testManager = VisualAcuityTestManager()
    @State private var feedback: FeedbackState? = nil
    @State private var testFinished = false
    
    enum FeedbackState {
        case correct
        case incorrect
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Header
            VStack(spacing: 6) {
                Text("Visual Acuity")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Testing \(eye.rawValue)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("Cover your other eye and tap the matching gap below.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            //.padding(.top, 20)
            
            Spacer()
            
            VStack(spacing: 20) {
                // MARK: - Small Landolt C
                SmallLandoltCView(
                    rotationAngle: testManager.rotationManager.rotationAngle,
                    size: testManager.currentSize
                )
                
                Text(feedback == .correct ? "Correct" : (feedback == .incorrect ? "Incorrect" : " "))
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
            questionIndex: testManager.attemptCount)
            .disabled(testFinished)
            .opacity(testFinished ? 0.5 : 1)
            
            Spacer()
            
            VStack {
                Button(action: {
                    let result = VisualAcuityResult(
                        eye: eye,
                        numerator: testManager.finalNumerator ?? 0,
                        //snellenValue: testManager.finalSnellen ?? "—",
                        attemptsUsed: testManager.attemptCount)
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
                // KUNCI UTAMA: Gunakan opacity & disabled, bukan 'if testFinished'
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
    }
    
    // MARK: - Tap Handling
    private func handleTap(_ tappedIndex: Int) {
        
        let isCorrect = testManager.registerAnswer(tappedIndex: tappedIndex)
        
        withAnimation(.easeIn(duration: 0.2)) {
            feedback = isCorrect ? .correct : .incorrect
        }
        
        if testManager.correctCount >= 9 {
            withAnimation(.spring()){
                testFinished = true
            }
        }
        
        // Clear feedback after short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            feedback = nil
        }
    }
}

#Preview {
    VisualAcuityTestView(
        eye: .right,
        onFinish: { result in
            print("Hasil tes: \(result.numerator)")
        }
    )
}
