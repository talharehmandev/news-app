import SwiftUI

/**
 * VIEW EXTENSION
 * Adds app-specific styling modifiers to SwiftUI Views.
 */
extension View {
    
    // Shortcut to apply the current theme color scheme and background
    func applyAppTheme() -> some View {
        self
            .preferredColorScheme(ThemeManager.shared.selectedColorScheme)
            .background(AppColors.background)
    }
}
