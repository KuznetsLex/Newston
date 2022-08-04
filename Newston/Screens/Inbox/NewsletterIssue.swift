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
                .padding(.vertical, 21)
                .padding(.horizontal, 14)
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
                    .padding()
                    .foregroundColor(Color("Gray"))
                Spacer()
            }
        }
        .background(.white)
        .aspectRatio(366/90, contentMode: .fit)
        .cornerRadius(15)
        .padding(.horizontal, 12)
    }
}
