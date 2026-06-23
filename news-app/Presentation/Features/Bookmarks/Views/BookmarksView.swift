import SwiftUI

struct BookmarksView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bookmarks Screen")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.text)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.background.ignoresSafeArea())
            .navigationTitle("Bookmarks")
        }
    }
}

#Preview {
    BookmarksView()
}
