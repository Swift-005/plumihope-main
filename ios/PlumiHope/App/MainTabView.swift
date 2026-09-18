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

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthManager.shared)
}
