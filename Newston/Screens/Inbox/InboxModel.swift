import Foundation

struct NewsletterIssue: Identifiable {
    var id = UUID()
    var title: String
    var authorName: String
    var authorLogoName: String
    var timeOfPublication: String
}
