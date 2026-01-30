import SwiftUI

struct ColorContrastFlowView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var selectedEye: EyeType? = nil
    @State private var nextEyeToTest: EyeType = .right   // 🔑 Right eye first

    @State private var leftEyeResult: ColorContrastResult? = nil
    @State private var rightEyeResult: ColorContrastResult? = nil

    var body: some View {

        // BOTH EYES DONE → SUMMARY
        if let left = leftEyeResult, let right = rightEyeResult {
            FinalColorContrastSummaryView(
                leftResult: left,
                rightResult: right,
                onDone: {
                    dismiss()
                }
            )
        }

        // TESTING A SELECTED EYE
        else if let eye = selectedEye {
            ColorContrastTestView(eye: eye) { result in
                handleResult(result, for: eye)
            }
            .id(eye)   // 🔑 Force fresh state per eye
        }

        // NO EYE SELECTED → SELECTION SCREEN
        else {
            EyeSelectionViewColorContrast(
                eyeToTest: nextEyeToTest,
                onSelectEye: { eye in
                    selectedEye = eye
                }
            )
        }
    }

    // MARK: - Handle Test Result
    private func handleResult(_ result: ColorContrastResult, for eye: EyeType) {

        switch eye {
        case .left:
            leftEyeResult = result
            selectedEye = nil
            nextEyeToTest = .right

        case .right:
            rightEyeResult = result
            selectedEye = nil
            nextEyeToTest = .left
        }
    }
}
