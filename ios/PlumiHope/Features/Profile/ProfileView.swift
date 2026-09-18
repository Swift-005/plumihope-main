import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var authManager: AuthManager
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if viewModel.isLoading && viewModel.user == nil {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 12) {
                        Text("Couldn't load profile")
                            .font(.headline)
                        Text(errorMessage)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Button("Try again") {
                            Task { await viewModel.load() }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let user = viewModel.user {
                    List {
                        Section {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullName)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }

                        Section("Activity") {
                            Button {
                                path.append(ProfileRoute.myHelpRequests)
                            } label: {
                                Label("Help requests", systemImage: "hand.raised")
                            }

                            Button {
                                path.append(ProfileRoute.myDonations)
                            } label: {
                                Label("My donations", systemImage: "heart.text.square")
                            }
                        }

                        Section {
                            Button(role: .destructive) {
                                authManager.logout()
                            } label: {
                                Text("Sign out")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationDestination(for: ProfileRoute.self) { route in
                switch route {
                case .myHelpRequests:
                    MyHelpRequestsView(path: $path)
                case .myDonations:
                    MyDonationsView(path: $path)
                }
            }
            .navigationDestination(for: HelpRequestRoute.self) { route in
                switch route {
                case .status(let requestId):
                    HelpRequestStatusView(requestId: requestId)
                default:
                    EmptyView()
                }
            }
            .navigationDestination(for: MyDonationsRoute.self) { route in
                switch route {
                case .detail(let donationId):
                    DonationDetailLoaderView(donationId: donationId)
                }
            }
            .task {
                await viewModel.load()
            }
        }
    }
}

enum ProfileRoute: Hashable {
    case myHelpRequests
    case myDonations
}

#Preview {
    ProfileView()
        .environmentObject(AuthManager.shared)
}
