import SwiftUI
import Kingfisher

extension NewsletterIssue {
    init(payload: IssuePayload) {
        self.init(id: payload.id ?? "id",
                  title: payload.title ?? "Something interesting...",
                  authorName: payload.newsletter!.title ?? "unknown",
                  iconURL: (payload.newsletter?.iconUrl!) ?? "http://51.250.88.170:4567/icons/3.png",
                  // в будущем поменять на progressIcon
                  timeOfPublication: Self.convertDate(dateString: payload.issuedAt),
                  isRead: payload.read ?? false,
                  isArchived: payload.archived ?? false)
    }
    private static func convertDate(dateString: String?) -> Date {
        guard let dateString = dateString else { return .init() }
            let timeFormatter = ISO8601DateFormatter()
        timeFormatter.formatOptions = [.withInternetDateTime]
        guard let date = timeFormatter.date(from: dateString) else { return .init() }
        return date
    }
}
protocol NewsletterIssueDisplayable {
    var titleDisplayable: String { get }
    var authorNameDisplayable: String { get }
    var iconURLDisplayable: String { get }
    var timeOfPublicationDisplayable: String { get }
    var isReadDisplayable: Bool { get }
    var isArchived: Bool { get }
}

extension NewsletterIssue: NewsletterIssueDisplayable {
    var titleDisplayable: String { title }
    var authorNameDisplayable: String { authorName }
    var iconURLDisplayable: String { iconURL }
    var timeOfPublicationDisplayable: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let issuedAtString = timeFormatter.string(from: timeOfPublication)
        return issuedAtString
    }

    var isReadDisplayable: Bool { isRead }
    var isArchivedDisplayable: Bool { isArchived }
}

struct NewsletterCardView: View {
    var item: NewsletterIssueDisplayable
    var body: some View {

        HStack {
            KFImage(URL(string: item.iconURLDisplayable))
                .cacheMemoryOnly()
                .fitToSquare()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 16)
                .padding(.trailing, 8)
            HStack(alignment: .top) {
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
                VStack {
                    Text(item.timeOfPublicationDisplayable)
                        .padding(.bottom, 62)
                        .foregroundColor(Color("Gray"))
                        .font(.custom("Helvetica Neue", size: 15, relativeTo: .subheadline))
                    Spacer()
                }
            }
            .padding(.trailing, 16)
            .padding(.top, 16)
        }
        .aspectRatio(390/96, contentMode: .fit)
        .background(.white)
        .cornerRadius(15)
        .padding(.horizontal, 12)
    }
}
