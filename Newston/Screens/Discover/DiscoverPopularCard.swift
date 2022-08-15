import SwiftUI

protocol DiscoverPopularCardDisplayable {
    var nameDisplayable: String { get }
    var summaryDisplayable: String { get }
    var authorLogoNameDisplayable: String { get }
    var isSubscribedDisplayable: Bool { get }
}

extension DiscoverPopularCard: DiscoverPopularCardDisplayable {
    var nameDisplayable: String { name }
    var summaryDisplayable: String { summary }
    var authorLogoNameDisplayable: String { authorLogoName }
    var isSubscribedDisplayable: Bool { isSubscribed }
}

struct DiscoverPopularCardView: View {
    var item: DiscoverPopularCard
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image(item.authorLogoName)
                .resizable()
                .frame(width: 64, height: 64)
                .padding(.top, 16)
            Text(item.name)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
                .lineLimit(2)
            Text(item.summary)
                .padding(.horizontal, 16)
                .font(.footnote)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
                .lineLimit(2)
            Spacer()
            Button {} label: {
                Text("Subscribe")
                    .foregroundColor(.white)
                    .padding(.horizontal, 35.5)
                    .padding(.vertical, 7)
                    .background(Color("Gray_tabs"))
                    .cornerRadius(10)
                    .font(.footnote)

            }
            .padding(.horizontal, 18)
            .padding(.bottom, 17)
        }
        .frame(width: 174, height: 217)
        .background(.white)
        .cornerRadius(10)
    }
}
