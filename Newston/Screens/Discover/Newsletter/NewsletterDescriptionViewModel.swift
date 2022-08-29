import SwiftUI

class NewsletterDescriptionViewModel: ObservableObject {
    @Published var issues: [NewsletterDescription] = []
    @Published var iconUrl: String?
    @Published var authorName: String?
    @Published var shortInfo: String?

    private let api: Api
    init(api: Api) {
        self.api = api
        fetchNewsletterDescription {
            self.iconUrl = self.issues[0].iconUrl
            self.authorName = self.issues[0].authorName
            self.shortInfo = self.issues[0].shortInfo
        }
    }

    func fetchNewsletterDescription(completion: @escaping () -> Void) {
        api.fetchNewsletterDescription { data in
            self.issues = data.map(NewsletterDescription.init)
            completion()
        }

    }
}
