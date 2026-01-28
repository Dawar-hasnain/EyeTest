import SwiftUI

struct HomeView: View {
    @State private var startAstigmatismTest = false
    @State private var startColorBlindTest = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 150) {

                    Text("Eye Health Tests")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    VStack(spacing: 20) {

                        NavigationLink(value: EyeTestType.visualAcuity) {
                            TestCard(
                                icon: "eye",
                                title: "Visual Acuity Test",
                                subtitle: "Measure sharpness of vision"
                            )
                        }

                        NavigationLink(value: EyeTestType.colorContrast) {
                            TestCard(
                                icon: "circle.lefthalf.filled",
                                title: "Color Contrast Test",
                                subtitle: "Detect contrast sensitivity"
                            )
                        }

                        NavigationLink(value: EyeTestType.colorBlindness) {
                            TestCard(
                                icon: "paintpalette",
                                title: "Color Blindness Test",
                                subtitle: "Identify color perception"
                            )
                        }

                        NavigationLink(value: EyeTestType.astigmatism) {
                            TestCard(
                                icon: "circle.grid.cross",
                                title: "Astigmatism Test",
                                subtitle: "Check distortion or blur"
                            )
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .navigationDestination(for: EyeTestType.self) { testType in
                switch testType{
                case .visualAcuity:
                    VisualAcuityFlowView()
                    
                case .colorContrast:
                    ColorContrastFlowView()
                
                case .colorBlindness:
                        ColorBlind()
                    
                case .astigmatism:
                        LeftEye()
                default:
                    EmptyView()
                    //TestPlaceholderView(testType: testType)
                }
            }
        }
    }
}
#Preview {
    HomeView()
}
