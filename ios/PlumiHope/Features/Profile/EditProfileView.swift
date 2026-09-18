import SwiftUI

struct EditProfileView: View {
    @StateObject private var viewModel: EditProfileViewModel
    var onSaved: () -> Void
    @Environment(\.dismiss) private var dismiss

    init(user: User, onSaved: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
        self.onSaved = onSaved
    }

    var body: some View {
        Form {
            Section("Name") {
                TextField("Full name", text: $viewModel.fullName)
                    .textContentType(.name)
            }

            Section("Phone") {
                TextField("Phone (optional)", text: $viewModel.phone)
                    .keyboardType(.phonePad)
            }

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
        }
        .navigationTitle("Edit profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                if viewModel.isSaving {
                    ProgressView()
                } else {
                    Button("Save") {
                        Task {
                            await viewModel.save()
                            if viewModel.didSave {
                                onSaved()
                                dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
}
