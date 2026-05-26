import SwiftUI
import Combine // This framework allows for "Reactive" programming (like Streams/Listeners in Flutter)

/**
 * THEME MANAGER (Equivalent to a 'ChangeNotifier' in Flutter)
 * This class handles the logic of switching themes across the entire app.
 */
class ThemeManager: ObservableObject {
    
    // Static Singleton: Allows you to access this manager from any file using 'ThemeManager.shared'
    // (Similar to a Global Provider or a Singleton in Flutter)
    static let shared = ThemeManager()
    
    // @Published: This is the magic part! 
    // Whenever this variable changes, it automatically notifies all "watching" Views to rebuild.
    // (Similar to calling 'notifyListeners()' in Flutter)
    @Published var selectedColorScheme: ColorScheme = .light
}

/**
 * VIEW EXTENSION (Equivalent to a Helper Method or a Custom Wrapper Widget)
 * This adds extra functionality to all SwiftUI Views.
 */
extension View {
    
    // This is a shortcut function. Instead of adding background and theme 
    // manually to every screen, you can just call .applyAppTheme()
    func applyAppTheme() -> some View {
        self
            // Tells this view which color scheme to use (Light vs Dark)
            .preferredColorScheme(ThemeManager.shared.selectedColorScheme)
            
            // Sets the background color using our central AppColors file
            .background(AppColors.background)
    }
}
