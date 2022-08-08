import Foundation

struct NewsletterIssue: Identifiable {
    let id = UUID()
    let title: String
    let authorName: String
    let authorLogoName: String
    let timeOfPublication: String
    var isRead: Bool
}
