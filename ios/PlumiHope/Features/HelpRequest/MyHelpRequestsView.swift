import SwiftUI

struct MyHelpRequestsView: View {
    @StateObject private var viewModel = MyHelpRequestsViewModel()
    var path: Binding<NavigationPath>

    var body: some View {
        Group {
            if viewModel.isLoading && viewModel.requests.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = viewModel.errorMessage {
                VStack(spacing: 12) {
                    Text("Couldn't load your requests")
                        .font(.headline)
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Button("Try again") {
                        Task { await viewModel.load() }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.requests.isEmpty {
                VStack(spacing: 12) {
                    Text("No help requests yet")
                        .font(.headline)
                    Text("Requests you submit will appear here.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.requests) { request in
                            Button {
                                path.wrappedValue.append(HelpRequestRoute.status(request.id))
                            } label: {
                                requestRow(request)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("My Help Requests")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.load()
        }
        .refreshable {
            await viewModel.load()
        }
    }

    private func requestRow(_ request: HelpRequestDetail) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(request.category.capitalized.replacingOccurrences(of: "_", with: " "))
                .font(.caption)
                .foregroundColor(.secondary)
            Text(request.description)
                .font(.body)
                .lineLimit(2)
                .foregroundColor(.primary)
            HStack {
                Text(statusLabel(request.status))
                    .font(.caption)
                    .fontWeight(.semibold)
                Spacer()
                Text(request.createdAt.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    private func statusLabel(_ status: String) -> String {
        "● " + status.capitalized.replacingOccurrences(of: "_", with: " ")
    }
}
