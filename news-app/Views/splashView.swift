import SwiftUI


struct SplashView: View {
    @State private var isActive = false // Tracks if we should show the Login screen
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            if isActive {
                loginView()
            } else {
                Image("applogo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(40)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
        }
    }
}



#Preview {
    SplashView()
}
