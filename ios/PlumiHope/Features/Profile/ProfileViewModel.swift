import Foundation
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service = UserService.shared

    func load() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            user = try await service.getMyProfile()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
