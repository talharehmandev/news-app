import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    static let shared = ThemeManager()
    
    @Published var selectedColorScheme: ColorScheme = .light
}

extension View {
    func applyAppTheme() -> some View {
        self
            .preferredColorScheme(.light)
            .background(AppColors.background)
    }
}
