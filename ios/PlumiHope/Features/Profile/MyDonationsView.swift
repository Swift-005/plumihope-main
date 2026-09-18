import SwiftUI

struct MyDonationsView: View {
    @StateObject private var viewModel = MyDonationsViewModel()
    var path: Binding<NavigationPath>

    var body: some View {
        Group {
            if viewModel.isLoading && viewModel.donations.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = viewModel.errorMessage {
                VStack(spacing: 12) {
                    Text("Couldn't load your donations")
                        .font(.headline)
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Button("Try again") {
                        Task { await viewModel.load() }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.donations.isEmpty {
                VStack(spacing: 12) {
                    Text("No donations yet")
                        .font(.headline)
                    Text("Your donation history will appear here.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.donations) { donation in
                            Button {
                                path.wrappedValue.append(MyDonationsRoute.detail(donation.id))
                            } label: {
                                donationRow(donation)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("My Donations")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.load()
        }
        .refreshable {
            await viewModel.load()
        }
    }

    private func donationRow(_ donation: Donation) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("৳\(donation.amount)")
                .font(.headline)
            HStack {
                Text(statusLabel(donation.status))
                    .font(.caption)
                    .fontWeight(.semibold)
                Spacer()
                Text(donation.createdAt.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    private func statusLabel(_ status: String) -> String {
        (status == "CONFIRMED" ? "✓ " : "● ") + status.capitalized
    }
}
