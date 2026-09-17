import SwiftUI

enum HelpRequestRoute: Hashable {
    case details
    case review
    case submitted
}

struct HelpRequestStartView: View {
    @StateObject private var viewModel = HelpRequestFormViewModel()
    @State private var path = NavigationPath()

    private let categoryLabels: [String: String] = [
        "MEDICAL": "Medical",
        "EDUCATION": "Education",
        "EMERGENCY": "Emergency",
        "LIVELIHOOD": "Livelihood",
        "DISASTER_RELIEF": "Disaster Relief",
        "FOOD": "Food",
        "HOUSING": "Housing",
        "DISABILITY": "Disability",
        "COMMUNITY_SUPPORT": "Community Support",
        "OTHER": "Other",
    ]

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Text("Request help")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("What kind of help is needed?")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.categories, id: \.self) { category in
                            Button {
                                viewModel.category = category
                                path.append(HelpRequestRoute.details)
                            } label: {
                                HStack {
                                    Text(categoryLabels[category] ?? category)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)
                            .foregroundColor(.primary)
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("")
            .navigationDestination(for: HelpRequestRoute.self) { route in
                switch route {
                case .details:
                    HelpRequestFormView(viewModel: viewModel, path: $path)
                case .review:
                    HelpRequestReviewView(viewModel: viewModel, path: $path)
                case .submitted:
                    HelpRequestSubmittedView(viewModel: viewModel, path: $path)
                }
            }
        }
    }
}
