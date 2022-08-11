import SwiftUI

protocol NewsletterIssueDisplayable {
    var titleDisplayable: String { get }
    var authorNameDisplayable: String { get }
    var authorLogoNameDisplayable: String { get }
    var timeOfPublicationDisplayable: String { get }
}

extension NewsletterIssue: NewsletterIssueDisplayable {
    var titleDisplayable: String { title }
    var authorNameDisplayable: String { authorName }
    var authorLogoNameDisplayable: String { authorLogoName }
    var timeOfPublicationDisplayable: String { timeOfPublication }
}

struct NewsletterCardView: View {
    var item: NewsletterIssueDisplayable
    var body: some View {

        HStack {
            Image(item.authorLogoNameDisplayable)
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
