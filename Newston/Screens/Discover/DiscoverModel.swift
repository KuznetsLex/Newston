import Foundation

struct DiscoverCategoryCard: Hashable {
    let name: String
    let imageUrl: String
}

struct DiscoverCategoriesPayload: Decodable {
    let name: String?
    let imageUrl: String?
}

struct NewsletterInCategory: Identifiable {
    let id: String
    let title: String
    let shortInfo: String
    let iconUrl: String
    let headline: String
    let subscribedAt: String
}

struct NewsletterInCategoryPayload: Decodable {
    let id: String?
    let title: String?
    let shortInfo: String?
    let iconUrl: String?
    let headline: String?
    let subscibedAt: String?
}

struct NewsletterDescription: Identifiable {
    let authorName: String
    let shortInfo: String
    let iconUrl: String

    let id: String
    let title: String
    let issueUrl: String
}

struct NewsletterDescriptionPayload: Decodable {
    let newsletter: AuthorInforamtionPayload

    let id: String?
    let title: String?
    let issueUrl: String?
}

struct AuthorInforamtionPayload: Decodable {
    let title: String?
    let shortInfo: String?
    let iconUrl: String?
}
