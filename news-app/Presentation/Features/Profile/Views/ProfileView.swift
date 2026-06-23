import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile Screen")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.text)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.background.ignoresSafeArea())
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
