import SwiftUI

class InboxViewModel: ObservableObject {
    var numberOfUnread: Int
    @Published var unreadInfo: String
    init() {
        numberOfUnread = 15
        unreadInfo = "\(numberOfUnread) unread"
    }

    let title = "Inbox"

    @Published var newsCardsContent = [
        NewsletterIssue(title: "Apple just challenged Figma. Michal Malewicz",
                        authorName: "Medium Daily Digest",
                        authorLogoName: "Medium Daily Digest",
                        timeOfPublication: "19:20"),
        NewsletterIssue(title: "The Big Lie Is Just The Pretext",
                        authorName: "Charlie Sykes - The Bulwark",
                        authorLogoName: "The Bulwark",
                        timeOfPublication: "16:30"),
        NewsletterIssue(title: "Android Weekly #525",
                        authorName: "Android Weekly",
                        authorLogoName: "Android Weekly",
                        timeOfPublication: "15:00"),
        NewsletterIssue(title: "The Good Thing About Hard Things",
                        authorName: "not boring",
                        authorLogoName: "not boring",
                        timeOfPublication: "14:00"),
        NewsletterIssue(title: "Working for the Weekend #7: Amash/Kmele 2022!",
                        authorName: "Bankless",
                        authorLogoName: "The Fifth Column",
                        timeOfPublication: "11:30"),
        NewsletterIssue(title: "hackernewsletter #604",
                        authorName: "Hacker News",
                        authorLogoName: "Hacker News",
                        timeOfPublication: "10:20"),
        NewsletterIssue(title: "The Morning. NY Daily July 19, 2022",
                        authorName: "New York Time",
                        authorLogoName: "New York Time",
                        timeOfPublication: "9:00")
    ]
}
