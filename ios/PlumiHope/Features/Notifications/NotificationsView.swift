import SwiftUI

struct NotificationsView: View {
    @StateObject private var viewModel = NotificationsViewModel()

    var body: some View {
        Group {
            if viewModel.isLoading && viewModel.notifications.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = viewModel.errorMessage {
                VStack(spacing: 12) {
                    Text("Couldn't load notifications")
                        .font(.headline)
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Button("Try again") {
                        Task { await viewModel.load() }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.notifications.isEmpty {
                VStack(spacing: 12) {
                    Text("No notifications yet")
                        .font(.headline)
                    Text("Updates about your donations and requests will appear here.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(viewModel.notifications) { notification in
                        notificationRow(notification)
                            .onTapGesture {
                                Task { await viewModel.markAsRead(notification) }
                            }
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    await viewModel.load()
                }
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.load()
        }
    }

    private func notificationRow(_ notification: AppNotification) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Circle()
                .fill(notification.readAt == nil ? Color.green : Color.clear)
                .frame(width: 8, height: 8)
                .padding(.top, 6)

            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .font(.subheadline)
                    .fontWeight(notification.readAt == nil ? .semibold : .regular)
                if let body = notification.body {
                    Text(body)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                Text(notification.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
