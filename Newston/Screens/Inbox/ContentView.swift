import SwiftUI
struct ContentView: View {
    @ObservedObject var inboxViewModel: InboxViewModel
    var body: some View {
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
                HStack {
                    Button {
                        // MARK: todo
                    } label: {
                        Text("Edit")
                            .font(.body)
                    }
                    Spacer()
                    Button {
                        // MARK: todo
                    } label: {
                        Image("discoverIcon")
                    }
                    Button {
                        // MARK: todo
                    } label: {
                        Image("profileIcon")
                    }
                    .padding(.leading, 11)
                }
            }
            .font(.title2)
            .foregroundColor(.black)
            .padding(.horizontal, 12)
            .padding(.top, 49)
            .frame(maxWidth: .infinity)
            ScrollView {
                VStack(spacing: 6) {
                    ForEach(inboxViewModel.newsCardsContent) { item in
                        NewsletterCardView(card: item)
                    }
                }
            }
        }
        .background(Color("Gray_background"))
        .ignoresSafeArea()
    }
}

struct NewsletterCardView: View {
    var card: NewsletterIssue
    var body: some View {
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
                    .font(.headline)
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
        .background(.white)
        .aspectRatio(366/90, contentMode: .fit)
        .cornerRadius(15)
        .padding(.horizontal, 12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let inboxViewModel = InboxViewModel()
        ContentView(inboxViewModel: inboxViewModel)
            .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portrait)
    }
}
