import Foundation
import Combine

@MainActor
final class NotificationsViewModel: ObservableObject {
    @Published var notifications: [AppNotification] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service = NotificationService.shared

    func load() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            notifications = try await service.listMyNotifications()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func markAsRead(_ notification: AppNotification) async {
        guard notification.readAt == nil else { return }
        do {
            let updated = try await service.markAsRead(id: notification.id)
            if let index = notifications.firstIndex(where: { $0.id == updated.id }) {
                notifications[index] = updated
            }
        } catch {
            // Non-fatal: leave the notification as unread in the UI if this fails.
        }
    }
}
