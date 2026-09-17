import SwiftUI

struct HelpRequestFormView: View {
    @ObservedObject var viewModel: HelpRequestFormViewModel
    var path: Binding<NavigationPath>

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Describe the situation")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                TextEditor(text: $viewModel.description)
                    .frame(height: 140)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Location")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    TextField("City, area", text: $viewModel.location)
                        .textFieldStyle(.roundedBorder)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Contact information")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    TextField("Phone or email", text: $viewModel.contactInfo)
                        .textFieldStyle(.roundedBorder)
                }

                Button {
                    path.wrappedValue.append(HelpRequestRoute.review)
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.description.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
