import SwiftUI

struct HelpRequestReviewView: View {
    @ObservedObject var viewModel: HelpRequestFormViewModel
    var path: Binding<NavigationPath>

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Review your request")
                    .font(.title2)
                    .fontWeight(.semibold)

                reviewRow("Category", viewModel.category.capitalized.replacingOccurrences(of: "_", with: " "))
                if !viewModel.location.isEmpty {
                    reviewRow("Location", viewModel.location)
                }
                reviewRow("Description", viewModel.description)

                Text("Important: Submitting a Help Request does not automatically create a fundraising campaign. Eligible Agents may investigate your case.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                }

                Button {
                    Task {
                        await viewModel.submit()
                        if viewModel.submittedRequest != nil {
                            path.wrappedValue.append(HelpRequestRoute.submitted)
                        }
                    }
                } label: {
                    if viewModel.isSubmitting {
                        ProgressView().frame(maxWidth: .infinity)
                    } else {
                        Text("Submit request").frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.isSubmitting)
            }
            .padding()
        }
        .navigationTitle("Review")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func reviewRow(_ label: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
    }
}
