import SwiftUI
import Kingfisher

extension NewsletterInCategory {
    init(payload: NewsletterInCategoryPayload) {
        self.init(id: payload.id ?? "id",
                  title: payload.title ?? "Unknown Title",
                  shortInfo: payload.shortInfo ?? "Unknown Info",
                  iconUrl: payload.iconUrl ?? "Unknown Url",
                  headline: payload.headline ?? "Unknown Headline",
                  subscribedAt: payload.subscibedAt ?? "Unknown Hour")
    }
}

protocol NewsletterInCategoryDisplayable {
    var titleDisplayable: String { get }
    var shortInfoDisplayable: String { get }
    var iconUrlDisplayable: String { get }
}

extension NewsletterInCategory: NewsletterInCategoryDisplayable {
    var titleDisplayable: String { title }
    var shortInfoDisplayable: String { shortInfo }
    var iconUrlDisplayable: String { iconUrl }
}

struct NewsletterView: View {
    var item: NewsletterInCategoryDisplayable
    var body: some View {
        Navigator.navigate(to: .discoverDescription, url: nil) {

        HStack {
            KFImage(URL(string: item.iconUrlDisplayable))
                .fitToSquare()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading, 16)
                .padding(.trailing, 8)
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.titleDisplayable)
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica Neue", size: 17, relativeTo: .headline))
                        .lineLimit(1)
                    Text(item.shortInfoDisplayable)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
                        .font(.custom("Helvetica Neue", size: 15, relativeTo: .subheadline))
                        .lineLimit(2)
                }
            Spacer()
            Image("plus")
                .padding(.trailing, 16)
                .padding(.vertical, 26)

        }
        .background(.white)
        .cornerRadius(15)
        .padding(.horizontal, 12)
    }
}
}
