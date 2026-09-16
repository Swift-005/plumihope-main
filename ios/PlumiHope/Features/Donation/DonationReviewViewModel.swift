import Foundation
import Combine

@MainActor
final class DonationReviewViewModel: ObservableObject {
    @Published var donation: DonationDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var paymentInitiated: Bool = false
    @Published var isConfirmed: Bool = false

    private let donationService = DonationService.shared
    let campaign: Campaign
    let amount: Double

    init(campaign: Campaign, amount: Double) {
        self.campaign = campaign
        self.amount = amount
    }

    func createDonation() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            donation = try await donationService.createDonation(campaignId: campaign.id, amount: amount)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func proceedToPayment() async {
        guard let donation = donation else { return }
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let result = try await donationService.initiatePayment(donationId: donation.id)
            paymentInitiated = true

            // DEV/SANDBOX ONLY — see DonationService.simulateSandboxWebhook.
            try await donationService.simulateSandboxWebhook(providerReference: result.providerReference)

            try await pollForConfirmation(donationId: donation.id)
        } catch {
            errorMessage = error.localizedDescription
            paymentInitiated = false
        }
    }

    private func pollForConfirmation(donationId: UUID) async throws {
        for _ in 1...5 {
            let updated = try await donationService.getDonation(id: donationId)
            self.donation = updated
            if updated.status == "CONFIRMED" {
                isConfirmed = true
                return
            }
            try await Task.sleep(nanoseconds: 500_000_000)
        }
        errorMessage = "Your donation is still being verified. Please check back in a moment."
        paymentInitiated = false
    }
}
