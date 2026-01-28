import SwiftUI

struct RightEye: View {
    //@Binding var isNavigationActive: Bool
    let leftEyeResult: Bool
    
    @State private var navigateToRightAstigmatism = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 30) {
                VStack {
                    Image(systemName: "eye.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    Text("Left")
                        .font(.caption)
                }
                VStack {
                    Image(systemName: "eye.slash.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("Right")
                        .font(.caption)
                }
            }
            .padding()
            
            Text("Cover Your Right Eye.")
                .padding()
            
            Button(action: {
                navigateToRightAstigmatism = true
            }) {
                Text("Next")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToRightAstigmatism) {
            RightAstigmatism(leftEyeResult: leftEyeResult,
            onDone: {
                dismiss()
            })
        }
    }
}

#Preview {
    NavigationStack {
        RightEye(
            leftEyeResult: true
        )
    }
}

