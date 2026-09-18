import Foundation
import Combine

@MainActor
final class EditProfileViewModel: ObservableObject {
    @Published var fullName: String
    @Published var phone: String
    @Published var isSaving: Bool = false
    @Published var errorMessage: String?
    @Published var didSave: Bool = false

    private let service = UserService.shared

    init(user: User) {
        self.fullName = user.fullName
        self.phone = user.phone ?? ""
    }

    func save() async {
        let trimmedName = fullName.trimmingCharacters(in: .whitespaces)
        guard !trimmedName.isEmpty else {
            errorMessage = "Name can't be empty."
            return
        }

        isSaving = true
        errorMessage = nil
        defer { isSaving = false }

        do {
            _ = try await service.updateProfile(
                fullName: trimmedName,
                phone: phone.trimmingCharacters(in: .whitespaces).isEmpty ? nil : phone
            )
            didSave = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
