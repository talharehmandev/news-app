import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            Text("Search Screen")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(AppColors.text)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background.ignoresSafeArea())
    }
}

#Preview {
    SearchView()
}
