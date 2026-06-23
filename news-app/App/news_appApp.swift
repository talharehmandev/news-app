import SwiftUI

@main
struct news_appApp: App {
    // This tells the app to "watch" the ThemeManager for changes
    @StateObject private var themeManager = ThemeManager.shared
    @State private var showMainApp = false
    
    var body: some Scene {
        WindowGroup {
            Group {
                if showMainApp {
                    MainTabView()
                } else {
                    SplashView(onGetStarted: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showMainApp = true
                        }
                    })
                }
            }
            .preferredColorScheme(themeManager.selectedColorScheme)
        }
    }
}
