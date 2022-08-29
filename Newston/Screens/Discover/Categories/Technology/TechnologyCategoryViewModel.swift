import SwiftUI

class TechnologyCategoryViewModel: ObservableObject {
    @Published var newsletters: [NewsletterInCategory] = []

    private let api: Api
    init(api: Api) {
        self.api = api
        fetchNewsletterCards()
    }

    func fetchNewsletterCards() {
        api.fetchDiscoverTechnology { data in
            self.newsletters = data.map(NewsletterInCategory.init)
        }
    }

    let title = "Technology"

}
