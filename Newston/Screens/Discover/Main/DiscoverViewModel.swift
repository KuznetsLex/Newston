import SwiftUI

class DiscoverViewModel: ObservableObject {
    @Published var categoryCards: [DiscoverCategoryCard] = []

    private let api: Api
    init(api: Api) {
        self.api = api
        fetchCategoryCards()
    }

    func fetchCategoryCards() {
        api.fetchDiscoverData { data in
            self.categoryCards = data.map(DiscoverCategoryCard.init)
        }
    }

    let title = "Discover"

}
