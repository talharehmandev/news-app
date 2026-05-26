import SwiftUI

@main
struct news_appApp: App {
    // This tells the app to "watch" the ThemeManager for changes
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                // Now we use the dynamic value from our manager!
                .preferredColorScheme(themeManager.selectedColorScheme)
        }
    }
}
