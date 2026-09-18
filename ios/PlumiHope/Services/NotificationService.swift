import Foundation

final class NotificationService {
    static let shared = NotificationService()
    private let client = APIClient.shared

    private init() {}

    func listMyNotifications() async throws -> [AppNotification] {
        let endpoint = APIEndpoint(path: "/notifications", method: .get, requiresAuth: true)
        return try await client.request(endpoint)
    }

    func markAsRead(id: UUID) async throws -> AppNotification {
        let endpoint = APIEndpoint(path: "/notifications/\(id.uuidString)/read", method: .post, requiresAuth: true)
        return try await client.request(endpoint)
    }
}
