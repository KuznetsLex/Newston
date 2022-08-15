import SwiftUI
import Alamofire
import SwiftyJSON

class InboxViewModel: ObservableObject {
    @Published var numberOfUnread: Int = 0
    let api: Api

    init(api: Api) {
        self.api = api
        api.fetchNewsletterIssues(inboxViewModel: self)
        self.numberOfUnread = numberOfUnread
    }

    @Published var newsCardsContent = [NewsletterIssue]()

    var unreadInfo: String {
        return "\(numberOfUnread) unread"
    }
    let title = "Inbox"

    @Published var isEditing = false
    @Published var selectedItems: Set<Int> = []
    var selectedInfo: String {
        if selectedItems.count == 0 {
            return "Inbox"
        } else {
            return "\(selectedItems.count) selected"
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
