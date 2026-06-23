import SwiftUI
import Combine

/**
 * THEME MANAGER
 * This class handles the logic of switching themes across the entire app.
 */
class ThemeManager: ObservableObject {
    
    // Static Singleton: Allows access to this manager from any file using 'ThemeManager.shared'
    static let shared = ThemeManager()
    
    // @Published: When this changes, it notifies all watching Views to rebuild.
    @Published var selectedColorScheme: ColorScheme = .light
}
