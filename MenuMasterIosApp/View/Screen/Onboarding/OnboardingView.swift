import SwiftUI

struct OnboardingView: View {
    var data: OnboardingData
    @Binding var currentTab: Int
    @Binding var welcomeTag: Bool
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Image(data.objectImage)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 400)
                .scaledToFit()
                .scaleEffect(isAnimating ? 1 : 0.8)
                .padding(.vertical,20)
            
            Text(data.primaryText)
                .bold()
                .font(.poppins(size: 24))
                .foregroundStyle(Color.theme.customDarkTextColor)
            
            Text(data.secondaryText)
                .font(.poppins(size: 16))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 350,minHeight: 70)
                .foregroundColor(Color.theme.customDarkTextColor)
            
            HStack(spacing: 8) {
                ForEach(OnboardingData.list.indices, id: \.self) { index in
                    Circle()
                        .fill(index == currentTab ? Color.theme.primaryOrangeColor : Color.theme.lightOrangeColor)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 30)
            
            Spacer()

        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    OnboardingView(data: OnboardingData.list.first!, currentTab: .constant(0), welcomeTag: .constant(false))
}
