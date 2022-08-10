import SwiftUI

class InboxViewModel: ObservableObject {
    var numberOfUnread: Int
    @Published var unreadInfo: String

    init() {
        numberOfUnread = 15
        unreadInfo = "\(numberOfUnread) unread"
    }

    let title = "Inbox"

    func toggleIssueRead() {
        // MARK: todo
    }
    func archiveIssue() {
        // MARK: todo
    }

    var toDiscoverActionLink: some View {
        Navigator.navigate(to: .discover) {
            Image("discoverIcon")
        }
    }

    var toProfileActionLink: some View {
        Navigator.navigate(to: .profile) {
            Image("profileIcon")
        }
    }

    var newsCardsContent = [
        NewsletterIssue(title: "Apple just challenged Figma. Michal Malewicz",
                        authorName: "Medium Daily Digest",
                        authorLogoName: "Medium Daily Digest",
                        timeOfPublication: "19:20",
                        isRead: false),
        NewsletterIssue(title: "The Big Lie Is Just The Pretext",
                        authorName: "Charlie Sykes - The Bulwark",
                        authorLogoName: "The Bulwark",
                        timeOfPublication: "16:30",
                        isRead: false),
        NewsletterIssue(title: "Android Weekly #525",
                        authorName: "Android Weekly",
                        authorLogoName: "Android Weekly",
                        timeOfPublication: "15:00",
                        isRead: false),
        NewsletterIssue(title: "The Good Thing About Hard Things",
                        authorName: "not boring",
                        authorLogoName: "not boring",
                        timeOfPublication: "14:00",
                        isRead: false),
        NewsletterIssue(title: "Working for the Weekend #7: Amash/Kmele 2022!",
                        authorName: "Bankless",
                        authorLogoName: "The Fifth Column",
                        timeOfPublication: "11:30",
                        isRead: false),
        NewsletterIssue(title: "hackernewsletter #604",
                        authorName: "Hacker News",
                        authorLogoName: "test",
                        timeOfPublication: "10:20",
                        isRead: false),
        NewsletterIssue(title: "The Morning. NY Daily July 19, 2022",
                        authorName: "New York Time",
                        authorLogoName: "New York Time",
                        timeOfPublication: "9:00",
                        isRead: false),
        NewsletterIssue(title: "Apple just challenged Figma. Michal Malewicz",
                        authorName: "Medium Daily Digest",
                        authorLogoName: "Medium Daily Digest",
                        timeOfPublication: "19:20",
                        isRead: false),
        NewsletterIssue(title: "The Big Lie Is Just The Pretext",
                        authorName: "Charlie Sykes - The Bulwark",
                        authorLogoName: "The Bulwark",
                        timeOfPublication: "16:30",
                        isRead: false),
        NewsletterIssue(title: "Android Weekly #525",
                        authorName: "Android Weekly",
                        authorLogoName: "Android Weekly",
                        timeOfPublication: "15:00",
                        isRead: false),
        NewsletterIssue(title: "The Good Thing About Hard Things",
                        authorName: "not boring",
                        authorLogoName: "not boring",
                        timeOfPublication: "14:00",
                        isRead: false)
    ]
}
