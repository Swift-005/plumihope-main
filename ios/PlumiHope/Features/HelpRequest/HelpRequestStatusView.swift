import SwiftUI

struct HelpRequestStatusView: View {
    let requestId: UUID

    @State private var request: HelpRequestDetail?
    @State private var isLoading = true
    @State private var errorMessage: String?

    private let service = HelpRequestService.shared

    private let timelineSteps: [String] = [
        "SUBMITTED", "AVAILABLE", "CLAIMED", "INVESTIGATING",
        "ELIGIBLE", "CONVERTED_TO_CAMPAIGN",
    ]

    var body: some View {
        Group {
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let request = request {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(request.category.capitalized.replacingOccurrences(of: "_", with: " "))
                            .font(.title2)
                            .fontWeight(.bold)

                        Text("● \(request.status.capitalized.replacingOccurrences(of: "_", with: " "))")
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        Text(request.description)
                            .font(.body)

                        if let location = request.location {
                            Text("Location: \(location)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }

                        Divider()

                        Text("TIMELINE")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)

                        timelineView(current: request.status)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Request status")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await load()
        }
    }

    private func timelineView(current: String) -> some View {
        let currentIndex = timelineSteps.firstIndex(of: current)
        return VStack(alignment: .leading, spacing: 12) {
            ForEach(Array(timelineSteps.enumerated()), id: \.offset) { index, step in
                HStack(spacing: 8) {
                    Image(systemName: reached(index, currentIndex) ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(reached(index, currentIndex) ? .green : .secondary)
                    Text(step.capitalized.replacingOccurrences(of: "_", with: " "))
                        .font(.subheadline)
                        .foregroundColor(reached(index, currentIndex) ? .primary : .secondary)
                }
            }
        }
    }

    private func reached(_ index: Int, _ currentIndex: Int?) -> Bool {
        guard let currentIndex = currentIndex else { return false }
        return index <= currentIndex
    }

    private func load() async {
        isLoading = true
        errorMessage = nil
        do {
            request = try await service.getHelpRequest(id: requestId)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
