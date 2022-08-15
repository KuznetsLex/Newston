import Foundation

struct DiscoverPopularCard: Identifiable {
    let id = UUID()
    let name: String
    let summary: String
    let authorLogoName: String
    var isSubscribed: Bool
}

struct DiscoverCategoryCard: Identifiable {
    let id = UUID()
    let name: String
    let logo: String
}
