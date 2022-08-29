import SwiftUI
import Kingfisher

struct NewsletterDescriptionView: View {
    @ObservedObject var newsletterDescriptionViewModel: NewsletterDescriptionViewModel
    var body: some View {
        VStack {
            selectedNewsletter
            latestIssues
        }
        .background(Color("Gray_background"))

    }
    var selectedNewsletter: some View {
            return VStack {
                KFImage(URL(string: newsletterDescriptionViewModel.iconUrl ?? "http://51.250.88.170:4567/icons/3.png"))
                    .fitToSquare()
                    .frame(width: 96, height: 96)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.leading, 16)
                    .padding(.trailing, 8)
                Text(newsletterDescriptionViewModel.authorName ?? "Publisher is loading...")
                    .font(.custom("Helvetica Neue", size: 22, relativeTo: .headline))
                Button {

                } label: {
                    Text("+ Subscribe")
                        .font(.custom("Helvetica Neue", size: 14, relativeTo: .headline))
                        .padding(.horizontal, 28)
                        .padding(.vertical, 10.5)
                        .foregroundColor(.white)
                        .background(Color("Gray_tabs"))
                        .cornerRadius(10)

                }
                Text(newsletterDescriptionViewModel.shortInfo ?? "Description is loading... please, re-enter this page")
                    .font(.custom("Helvetica Neue", size: 16, relativeTo: .headline))
                    .foregroundColor(.gray)
            }

    }
    var latestIssues: some View {
        List(newsletterDescriptionViewModel.issues) { item in
            NewsletterDescriptionIssueView(item: item)
                .listRowBackground(Color("Gray_background"))
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 4, leading: 0, bottom: 4, trailing: 0))
        }

    .listStyle(.plain)
    .navigationBarTitleDisplayMode(.inline)
    .background(Color("Gray_background"))
    }
}
