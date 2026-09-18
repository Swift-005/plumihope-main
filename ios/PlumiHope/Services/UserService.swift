import Foundation

struct UserProfileUpdateRequest: Encodable {
    let fullName: String?
    let phone: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case phone
    }
}

final class UserService {
    static let shared = UserService()
    private let client = APIClient.shared

    private init() {}

    func getMyProfile() async throws -> User {
        let endpoint = APIEndpoint(path: "/users/me", method: .get, requiresAuth: true)
        return try await client.request(endpoint)
    }

    func updateProfile(fullName: String?, phone: String?) async throws -> User {
        let body = UserProfileUpdateRequest(fullName: fullName, phone: phone)
        let endpoint = APIEndpoint(path: "/users/me", method: .patch, requiresAuth: true)
        return try await client.request(endpoint, body: body)
    }
}
