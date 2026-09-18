import SwiftUI

struct DonationDetailLoaderView: View {
    let donationId: UUID

    @State private var donation: DonationDetail?
    @State private var isLoading = true
    @State private var errorMessage: String?

    private let service = DonationService.shared

    var body: some View {
        Group {
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let donation = donation {
                DonationReceiptView(donation: donation)
            }
        }
        .task {
            await load()
        }
    }

    private func load() async {
        isLoading = true
        errorMessage = nil
        do {
            donation = try await service.getDonation(id: donationId)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
