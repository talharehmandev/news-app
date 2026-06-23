import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    let onGetStarted: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Top Image Card
                Image("splash-icon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width - 48, height: geometry.size.height * 0.55)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                    .padding(.horizontal, 24)
                    .padding(.top, geometry.safeAreaInsets.top > 0 ? 10 : 20)
                
                Spacer(minLength: 12)
                
                // Brand Title "NEWSWIRE"
                Text("NEWSWIRE")
                    .font(.system(size: 36, weight: .black, design: .default))
                    .italic()
                    .foregroundColor(AppColors.text)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 12)
                
                // Get Started Button
                Button(action: {
                    // Haptic feedback
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                    onGetStarted()
                }) {
                    HStack(spacing: 8) {
                        Text("Get Started")
                            .font(.system(size: 18, weight: .bold))
                        
                        Image(systemName: "arrow.right")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(AppColors.coral)
                    .cornerRadius(30)
                    .shadow(color: AppColors.coral.opacity(0.35), radius: 10, x: 0, y: 5)
                }
                .buttonStyle(AnimatedButtonStyle())
                .padding(.horizontal, 36)
                
                Spacer()
                    .frame(height: 20)
                
                // Copyright Footer Text
                Text("© 2024 NEWSWIRE MEDIA GROUP")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(AppColors.secondaryText)
                    .opacity(0.7)
                    .padding(.bottom, geometry.safeAreaInsets.bottom > 0 ? 8 : 16)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .background(AppColors.background.ignoresSafeArea())
    }
}

#Preview {
    SplashView(onGetStarted: {})
}

