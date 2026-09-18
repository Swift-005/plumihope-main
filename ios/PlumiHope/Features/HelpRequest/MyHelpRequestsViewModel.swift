import Foundation
import Combine

@MainActor
final class MyHelpRequestsViewModel: ObservableObject {
    @Published var requests: [HelpRequestDetail] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service = HelpRequestService.shared

    func load() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            requests = try await service.listMyHelpRequests()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
