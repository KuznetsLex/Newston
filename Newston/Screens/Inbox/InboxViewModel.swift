import SwiftUI
import Alamofire

class InboxViewModel: ObservableObject {
    @Published var numberOfUnread: Int? = 0
    @Published var newsCardsContent: [NewsletterIssue] = []
    let api: Api

    init(api: Api) {
        self.api = api
        api.fetchInboxData { data in
            if let unreadCount = data.unreadCount {
                self.numberOfUnread = unreadCount
            }
            if let issues = data.issues {
                self.newsCardsContent = issues.map(NewsletterIssue.init)
            }
        }
    }

    let title = "Inbox"

    var unreadInfo: String {
        if numberOfUnread == nil {
            return "waiting fir service response..."
        } else {
            return "\(String(describing: numberOfUnread!)) unread"
        }
    }

    var toDiscoverActionLink: some View {
//        Navigator.navigate(to: .discover) { 
            Image("discoverIcon")
//        }
    }
    var toProfileActionLink: some View {
//        Navigator.navigate(to: .profile) {
            Image("profileIcon")
//        }
    }

    @Published var isEditing = false
    @Published var selectedItems: Set<String> = []
    var selectedInfo: String {
        if selectedItems.count == 0 {
            return "Inbox"
        } else {
            return "\(selectedItems.count) selected"
        }
    }

    func toggleIssueRead(for item: NewsletterIssue) {
        objectWillChange.send()
        if let chosenIndex = newsCardsContent.firstIndex(where: { $0.id == item.id }) {
            newsCardsContent[chosenIndex].isRead.toggle()
        }
    }

    func archiveIssue(_ item: NewsletterIssue) {
        objectWillChange.send()
        if let chosenIndex = newsCardsContent.firstIndex(where: { $0.id == item.id }) {
            newsCardsContent.remove(at: chosenIndex)
        }
    }

    func archiveSelectedIssues() {
        objectWillChange.send()
        for item in newsCardsContent {
            if selectedItems.contains(item.id) {
                newsCardsContent = newsCardsContent.filter { $0 != item }
            }
        }
        selectedItems = []
    }

}
