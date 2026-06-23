import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Home Screen")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.text)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.background.ignoresSafeArea())
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
