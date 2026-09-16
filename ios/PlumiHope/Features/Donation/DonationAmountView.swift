import SwiftUI

struct DonationAmountView: View {
    let campaign: Campaign
    @State private var selectedAmount: Double?
    @State private var customAmount: String = ""
    @State private var confirmedAmount: Double?

    private let presetAmounts: [Double] = [500, 1000, 2000]

    var body: some View {
        VStack(spacing: 24) {
            Text(campaign.title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("Choose amount")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 12) {
                ForEach(presetAmounts, id: \.self) { amount in
                    Button {
                        selectedAmount = amount
                        customAmount = ""
                    } label: {
                        Text("৳\(Int(amount))")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.bordered)
                    .tint(selectedAmount == amount ? .green : .gray)
                }
            }

            TextField("Custom amount", text: $customAmount)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .onChange(of: customAmount) { _, newValue in
                    if let value = Double(newValue) {
                        selectedAmount = value
                    }
                }

            Text("Your donation helps fund verified assistance.")
                .font(.footnote)
                .foregroundColor(.secondary)

            Spacer()

            Button {
                confirmedAmount = selectedAmount
            } label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(selectedAmount == nil || selectedAmount == 0)
        }
        .padding()
        .navigationTitle("Donate")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(item: $confirmedAmount) { amount in
            DonationReviewView(campaign: campaign, amount: amount)
        }
    }
}
