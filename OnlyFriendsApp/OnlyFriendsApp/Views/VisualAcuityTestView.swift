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
        VStack(spacing: 28) {

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

            // MARK: - Small Landolt C
            SmallLandoltCView(
                rotationAngle: testManager.rotationManager.rotationAngle,
                size: testManager.currentSize
            )

            // MARK: - Feedback
            if let feedback {
                Text(feedback == .correct ? "Correct" : "Incorrect")
                    .font(.headline)
                    .foregroundColor(feedback == .correct ? .green : .red)
            }

            // MARK: - Clickable Ring
            ClickableRingView { tappedIndex in
                handleTap(tappedIndex)
            }
            .disabled(testFinished)
            .opacity(testFinished ? 0.5 : 1)

            // MARK: - Next Button (only when finished)
            if testFinished {
                Button("Next") {
                    let result = VisualAcuityResult(
                        eye: eye,
                        numerator: testManager.finalNumerator ?? 0,
                        //snellenValue: testManager.finalSnellen ?? "—",
                        attemptsUsed: testManager.attemptCount
                    )
                    onFinish(result)
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 12)
            }

            Spacer()
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
        feedback = isCorrect ? .correct : .incorrect

        if testManager.correctCount >= 9 {
            testFinished = true
        }

        // Clear feedback after short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            feedback = nil
        }
    }
}
