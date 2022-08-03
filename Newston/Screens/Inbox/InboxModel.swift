import Foundation

struct NewsletterIssue: Identifiable {
    let id = UUID()
    let title: String
    let authorName: String
    let authorLogoName: String
    let timeOfPublication: String
}

protocol NewsletterIssueDisplayable {
    var titleDisplayable: String { get }
    var authorNameDisplayable: String { get }
    var authorLogoNameDisplayable: String { get }
    var timeOfPublicationDisplayable: String { get }
}
