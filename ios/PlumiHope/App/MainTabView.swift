import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            ExploreView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }

            HelpRequestStartView()
                .tabItem {
                    Label("Request Help", systemImage: "hand.raised")
                }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthManager.shared)
}
