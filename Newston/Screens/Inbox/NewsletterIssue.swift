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
                .padding(.vertical, 24)
                .padding(.horizontal, 16)
            VStack(alignment: .leading) {
                Text(item.authorNameDisplayable)
                    .font(.footnote)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                Text(item.titleDisplayable)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .lineLimit(2)
                Spacer()
            }.padding(.top, 16)
            Spacer()
            VStack {
                Text(item.timeOfPublicationDisplayable)
                    .font(.footnote)
                    .padding(.trailing, 16)
                    .padding(.top, 16)
                    .foregroundColor(Color("Gray"))
                Spacer()
            }
        }
        .aspectRatio(390/96, contentMode: .fit)
        .background(.white)
        .cornerRadius(15)
        .padding(.vertical, 4)
    }
}
