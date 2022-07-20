import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color("Gray_background"))

      VStack {
        ZStack {
          VStack(spacing: 0.0) {
            Text("Inbox")
              .font(.headline)
              .fontWeight(.semibold)
              .foregroundColor(.black)
              .padding(.top, 5.0)
            unreadNewsletters
            Divider().background(.gray)
          }
          HStack {
            Spacer()
            Button {
              print("World")
            } label: {
              VStack {
                Image(systemName: "sparkle.magnifyingglass")
              }
            }
            Button {
              print("World")
            } label: {
              VStack {
                Image(systemName: "person.fill")
              }
            }
          }
          .font(.title2)
          .foregroundColor(Color("Gray_tabs"))
          .padding(10)
        }
        .frame(maxWidth: .infinity)
        .background(.white)

        ScrollView {
          ForEach(newsCardsContent) { item in
            NewsletterCardView(card: item)
          }
        }
      }
    }
  }
  var unreadNewsletters: some View {
    HStack {
      Circle()
        .foregroundColor(Color("Light_green"))
        .frame(width: 9, height: 9)
      // MARK: Number of unread - в Model
      Text("\(zat1) unread newsletters   ")
        .font(.footnote)
        .fontWeight(.regular)
        .foregroundColor(Color("Gray"))
    }.padding(.bottom, 6)
  }
  var zat1 = 12
}
struct NewsletterCardView: View {
  var card: Newsletter
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.white)
        .aspectRatio(366/90, contentMode: .fit)
        .cornerRadius(15)

      VStack {
        HStack {
          Text(card.title).foregroundColor(.black)
            .fontWeight(.bold)
          Spacer()
          if card.isFavorite == false {
            Image(systemName: "star")
              .font(.title2)
              .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
          } else {
            Image(systemName: "star.fill")
              .font(.title)
          }
        }
        Spacer()
        Spacer()
        Spacer()
        HStack {
          Text(card.authorName).foregroundColor(.black)
          Spacer()
          Text(card.timeSincePublication).foregroundColor(Color("Gray"))
            .font(.footnote)
        }
      }
      .padding(.vertical, 9)
      .padding(.horizontal, 20)
    }
    .padding(.horizontal)
  }
}

// MARK: Заполнение газетами - в Model
struct Newsletter: Identifiable {
  var id = UUID()
  var title: String
  var authorName: String
//  var author_logo: Image добавлю позже
  var isFavorite: Bool = false
  var timeSincePublication: String
}

let newsCardsContent = [
  Newsletter(title: "Android Weekly #525",
             authorName: "Android Weekly",
             timeSincePublication: "5 min ago"
             ),
  Newsletter(title: "hackernewletter #604",
             authorName: "Hacker News",
             timeSincePublication: "10 min ago"),
  Newsletter(title: "The Big Lie Is Just the Pretext",
             authorName: "Charlie Sykes - The Bulwark",
             timeSincePublication: "30 min ago"),
  Newsletter(title: "The Crypto Revolution",
             authorName: "Bankless",
             timeSincePublication: "1 hour ago"),
  Newsletter(title: "Does SBF Own Everything?",
             authorName: "Bankless",
             timeSincePublication: "3 hours ago"),
  Newsletter(title: "Does SBF Own Everything?",
             authorName: "Bankless",
             timeSincePublication: "3 hours ago"),
  Newsletter(title: "Does SBF Own Everything?",
             authorName: "Bankless",
             timeSincePublication: "3 hours ago")
]

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
//    NewsletterCardView()
      .previewDevice("iPhone 12")
  }

}
