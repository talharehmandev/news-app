import SwiftUI


struct SplashView: View {
    @State private var isActive = false // Tracks if we should show the Login screen
    
    var body: some View {
        if isActive {
            loginView() // Replace this with your actual Login View name
        } else {
            Image("applogo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(40)
                .onAppear {
                    // Start the timer when the view appears
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}



#Preview {
    SplashView()
}
