import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if viewModel.isLoading && viewModel.campaigns.isEmpty {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 12) {
                        Text("Couldn't load campaigns")
                            .font(.headline)
                        Text(errorMessage)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Button("Try again") {
                            Task { await viewModel.loadCampaigns() }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if viewModel.campaigns.isEmpty {
                    VStack(spacing: 12) {
                        Text("No campaigns found")
                            .font(.headline)
                        Text("Try another search term.")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.campaigns) { campaign in
                                Button {
                                    path.append(campaign.id)
                                } label: {
                                    CampaignCard(campaign: campaign)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Discover")
            .searchable(text: $viewModel.searchText, prompt: "Search campaigns...")
            .onSubmit(of: .search) {
                Task { await viewModel.loadCampaigns() }
            }
            .navigationDestination(for: UUID.self) { campaignId in
                CampaignDetailView(campaignId: campaignId, navigationPath: $path)
            }
            .navigationDestination(for: DonationRoute.self) { route in
                switch route {
                case .amount(let campaign):
                    DonationAmountView(campaign: campaign, navigationPath: $path)
                }
            }
            .navigationDestination(for: DonationReviewRoute.self) { route in
                DonationReviewView(campaign: route.campaign, amount: route.amount, navigationPath: $path)
            }
            .task {
                await viewModel.loadCampaigns()
            }
        }
    }
}

#Preview {
    ExploreView()
}
