import SwiftUI
import Kingfisher

extension NewsletterDescription {
    init(payload: NewsletterDescriptionPayload) {
        self.init(
            authorName: payload.newsletter.title ?? "Unknown Publisher",
            shortInfo: payload.newsletter.shortInfo ?? "Info is unavailable",
            iconUrl: (payload.newsletter.iconUrl) ?? "http://51.250.88.170:4567/icons/3.png",
            id: payload.id ?? "id",
            title: payload.title ?? "Unknown Title",
            issueUrl: payload.issueUrl ?? "http://51.250.88.170:4567/icons/3.png")
    }
}

protocol NewsletterDescriptionDisplayable {
    var authorNameDisplayable: String { get }
    var shortInfoDisplayable: String { get }
    var iconUrlDisplayable: String { get }
    var titleDisplayable: String { get }
    var issueUrlDisplayable: String { get }
}

extension NewsletterDescription: NewsletterDescriptionDisplayable {
    var authorNameDisplayable: String { authorName }
    var shortInfoDisplayable: String { shortInfo }
    var iconUrlDisplayable: String { iconUrl }
    var titleDisplayable: String { title }
    var issueUrlDisplayable: String { issueUrl }
}

struct NewsletterDescriptionIssueView: View {
    var item: NewsletterDescriptionDisplayable
    var body: some View {
        Navigator.navigate(to: .issue, url: item.issueUrlDisplayable) {

        HStack {
            KFImage(URL(string: item.iconUrlDisplayable))
                .fitToSquare()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 16)
                .padding(.trailing, 8)
                .padding(.vertical, 24)
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.authorNameDisplayable)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
                        .font(.custom("Helvetica Neue", size: 15, relativeTo: .subheadline))
                        .lineLimit(1)
                    Text(item.titleDisplayable)
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica Neue", size: 17, relativeTo: .headline))
                        .lineLimit(2)
                }
            Spacer()
        }
        .background(.white)
        .cornerRadius(15)
        .padding(.horizontal, 12)
    }
    }
}
