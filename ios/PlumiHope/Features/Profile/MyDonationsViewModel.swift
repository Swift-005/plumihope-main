import Foundation
import Combine

@MainActor
final class MyDonationsViewModel: ObservableObject {
    @Published var donations: [Donation] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service = DonationService.shared

    func load() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            donations = try await service.listMyDonations()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

enum MyDonationsRoute: Hashable {
    case detail(UUID)
}
