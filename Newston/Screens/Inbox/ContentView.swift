import SwiftUI
struct ContentView: View {
    @StateObject private var inboxVM = InboxVM()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Gray_background"))
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        // MARK: todo
                    } label: {
                        VStack {
                            Image(systemName: "binoculars.fill")
                        }
                    }
                    Spacer()
                    VStack(spacing: 0.0) {
                        Text("Inbox")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("\(inboxVM.numberOfUnread) unread")
                            .font(.footnote)
                            .fontWeight(.regular)
                            .foregroundColor(Color("Gray"))
                            .padding(.bottom, 6)
                    }
                    Spacer()
                    Button {
                        // MARK: todo
                    } label: {
                        VStack {
                            Image(systemName: "person.fill")
                        }
                    }
                }
                .font(.title2)
                .foregroundColor(.black)
                .padding(.horizontal, 12)

                .padding(.top, 14)
                .frame(maxWidth: .infinity)

                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(inboxVM.newsCardsContent) { item in
                            NewsletterCardView(card: item)
                        }
                    }
                }
            }
        }
    }

}
struct NewsletterCardView: View {
    var card: NewsletterIssue
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .aspectRatio(366/90, contentMode: .fit)
                .cornerRadius(15)
            HStack {
                Image(card.authorLogoName)
                    .padding(.vertical, 21)
                    .padding(.horizontal, 14)
                VStack(alignment: .leading) {
                    Text(card.authorName)
                        .font(.footnote)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
                        .lineLimit(1)
                    Text(card.title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .lineLimit(2)
                    Spacer()
                }.padding(.top, 16)
                Spacer()
                VStack {
                    Text(card.timeOfPublication)
                        .font(.footnote)
                        .padding()
                        .foregroundColor(Color("Gray"))
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
            .previewInterfaceOrientation(.portrait)
    }

}
