import Foundation

struct NewsletterIssue: Identifiable, Equatable, Hashable {
    let id: Int
    let title: String
    let authorName: String
    let authorLogoName: String
    let timeOfPublication: String
    var isRead: Bool
    var archived: Bool
}
