import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house.fill"
    case search = "magnifyingglass"
    case bookmarks = "bookmark"
    case profile = "person"
    
    var label: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .bookmarks: return "Bookmarks"
        case .profile: return "Profile"
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            CustomAppBar()
                .zIndex(1)
            
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .search:
                    Text("Search View")
                case .bookmarks:
                    Text("Bookmarks View")
                case .profile:
                    ProfileView() // Assuming ProfileView exists
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = tab
                    }
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: tab.rawValue)
                            .font(.system(size: 20, weight: .medium))
                        Text(tab.label)
                            .font(.system(size: 12, weight: .medium))
                    }
                    .foregroundColor(selectedTab == tab ? AppColors.maroon : .gray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(selectedTab == tab ? AppColors.lightPink : Color.clear)
                    )
                }
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .background(
            Color.white
                .shadow(color: .black.opacity(0.05), radius: 4, y: -2)
        )
    }
}

#Preview {
    MainTabView()
}
