import SwiftUI
struct InboxView: View {
    @ObservedObject var inboxViewModel: InboxViewModel
    var body: some View {
        NavigationView {
            VStack {

                ZStack {

                    VStack(spacing: 0.0) {
                        Text(inboxViewModel.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text(inboxViewModel.unreadInfo)
                            .font(.footnote)
                            .fontWeight(.regular)
                            .foregroundColor(Color("Gray"))
                            .padding(.bottom, 6)
                    }

                    HStack(spacing: 0) {
                        Button {
                            // MARK: todo
                        } label: {
                            Text("Edit")
                                .font(.body)
                                .padding(.horizontal, 12)
                        }
                        Spacer()
                        Button {} label: {
                            Navigator.navigate(to: .discover) {
                                Image("discoverIcon")
                            }
                        }
                        Button {} label: {
                            Navigator.navigate(to: .profile) {
                                Image("profileIcon")
                            }
                        }
                        .padding(.leading, 11)
                        .padding(.trailing, 9)
                    }

                }
                .font(.title2)
                .foregroundColor(.black)
                .padding(.top, 18)
                .frame(maxWidth: .infinity)

                ScrollView {
                    VStack(spacing: 6) {
                        ForEach(inboxViewModel.newsCardsContent) { item in
                            NewsletterCardView(item: item)
                        }
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .background(Color("Gray_background"))
        }
    }
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

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        let inboxViewModel = InboxViewModel()
        InboxView(inboxViewModel: inboxViewModel)
            .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portrait)
    }
}
