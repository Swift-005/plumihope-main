import Foundation

final class UserService {
    static let shared = UserService()
    private let client = APIClient.shared

    private init() {}

    func getMyProfile() async throws -> User {
        let endpoint = APIEndpoint(path: "/users/me", method: .get, requiresAuth: true)
        return try await client.request(endpoint)
    }
}
