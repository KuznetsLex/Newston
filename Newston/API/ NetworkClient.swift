import Alamofire
import SwiftyJSON

// swiftlint: disable force_try

class Api {
    func fetchNewsletterIssues(inboxViewModel: InboxViewModel) {
        AF.request("https://virtserver.swaggerhub.com/ORGTEAM/newston_api/1.0.0/inbox").responseData { (data) in
            let json = try! JSON(data: data.data!)
            inboxViewModel.numberOfUnread = json["unreadCounter"].intValue
            for item in json["newslettersAndIssues"] {
                let fullTime = item.1["issues"][0]["issuedAt"].stringValue
                let start = fullTime.index(fullTime.startIndex, offsetBy: 12)
                let end = fullTime.index(fullTime.endIndex, offsetBy: -9)
                let range = start..<end
                let time = String(fullTime[range])

                inboxViewModel.newsCardsContent.append(NewsletterIssue(
                    id: item.1["issues"][0]["id"].intValue,
                    title: item.1["issues"][0]["title"].stringValue,
                    authorName: item.1["newsletter"]["title"].stringValue,
                    authorLogoName: item.1["newsletter"]["icon"].stringValue,
                    timeOfPublication: time,
                    isRead: item.1["issues"][0]["read"].boolValue,
                    archived: item.1["issues"][0]["archived"].boolValue))
            }
        }
    }
}

// swiftlint: enable force_try
