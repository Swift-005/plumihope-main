import Foundation

enum DonationRoute: Hashable {
    case amount(Campaign)
}

extension Campaign: Hashable {
    static func == (lhs: Campaign, rhs: Campaign) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
