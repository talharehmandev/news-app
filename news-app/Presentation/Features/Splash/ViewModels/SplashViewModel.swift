import Foundation
import Combine

/**
 * SPLASH VIEW MODEL
 * Manages initial app loading logic and routing logic.
 */
@MainActor
class SplashViewModel: ObservableObject {
    @Published var isFinishedLoading = false
    
    func performInitialSetup() async {
        // Simulate remote config fetches, user profile checks, or database migrations
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds delay
            self.isFinishedLoading = true
        } catch {
            self.isFinishedLoading = true
        }
    }
}
