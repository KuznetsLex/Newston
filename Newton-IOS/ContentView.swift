import SwiftUI
struct ContentView: View {
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color("Gray_background"))
        .ignoresSafeArea()

      VStack {
        HStack {
          Button {
            print("World")// затычка
          } label: {
            VStack {
              Image(systemName: "sparkle.magnifyingglass")
            }
          }
          Spacer()
          VStack(spacing: 0.0) {
            Text("Inbox")
              .font(.headline)
              .fontWeight(.semibold)
            unreadNewsletters
          }
          Spacer()
          Button {
            print("World")// затычка
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
            ForEach(newsCardsContent) { item in
              NewsletterCardView(card: item)
            }
          }
        }
      }
    }
  }
  var unreadNewsletters: some View {
    HStack {
      Circle()
        .foregroundColor(Color("Light_green"))
        .frame(width: 7, height: 7)
      // MARK: Number of unread - в Model
      Text("\(zat1) unread")
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
      HStack {
        Image(card.authorLogoName)
          .padding(.vertical, 21)
          .padding(.horizontal, 14)
        VStack(alignment: .leading) {
          Text(card.authorName)
            .font(.footnote)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
          Text(card.title)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.black)
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

// MARK: Заполнение газетами - в Model
struct Newsletter: Identifiable {
  var id = UUID()
  var title: String
  var authorName: String
  var authorLogoName: String
  var timeOfPublication: String
}

let newsCardsContent = [
  Newsletter(title: "Apple just challenged Figma. Michal Malewicz",
             authorName: "Medium Daily Digest",
             authorLogoName: "Medium Daily Digest",
             timeOfPublication: "19:20"
            ),
  Newsletter(title: "The Big Lie Is Just The Pretext",
             authorName: "Charlie Sykes - The Bulwark",
             authorLogoName: "The Bulwark",
             timeOfPublication: "16:30"),
  Newsletter(title: "Android Weekly #525",
             authorName: "Android Weekly",
             authorLogoName: "Android Weekly",
             timeOfPublication: "15:00"),
  Newsletter(title: "The Good Thing About Hard Things",
             authorName: "not boring",
             authorLogoName: "not boring",
             timeOfPublication: "14:00"),
  Newsletter(title: "Working for the Weekend #7: Amash/Kmele 2022!",
             authorName: "Bankless",
             authorLogoName: "The Fifth Column",
             timeOfPublication: "11:30"),
  Newsletter(title: "hackernewsletter #604",
             authorName: "Hacker News",
             authorLogoName: "Hacker News",
             timeOfPublication: "10:20"),
  Newsletter(title: "The Morning. NY Daily July 19, 2022",
             authorName: "New York Time",
             authorLogoName: "New York Time",
             timeOfPublication: "9:00")
]
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 12")
      .previewInterfaceOrientation(.portrait)
  }

}
