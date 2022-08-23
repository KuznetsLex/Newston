import Foundation

struct NewsletterIssue: Identifiable, Equatable {
    let id: String
    let title: String
    let authorName: String
    let iconURL: String
    let timeOfPublication: Date
    var isRead: Bool
    var isArchived: Bool
}

struct InboxPayload: Decodable {
    let unreadCount: Int?
    let issues: [IssuePayload]?

}

struct NewsletterPayload: Decodable {
    let id: String?
    let title: String?
    let iconUrl: String?
}

struct IssuePayload: Decodable {
    let id: String?
    let newsletter: NewsletterPayload?
    let title: String?
    let issuedAt: String?
    let addedToFavoritesAt: String?
    var read: Bool?
    var archived: Bool?
}
