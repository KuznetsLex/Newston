import SwiftUI
struct InboxView: View {
    @ObservedObject var inboxViewModel: InboxViewModel
    var body: some View {
        NavigationView {
            VStack {
                navigationBar
                scrollingIssues
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .background(Color("Gray_background"))
        }
    }
}

var navigationBar: some View {
    let inboxViewModel = InboxViewModel()
    return ZStack {
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
}

var scrollingIssues: some View {
    let inboxViewModel = InboxViewModel()
    return ScrollView {
        VStack(spacing: 6) {
            ForEach(inboxViewModel.newsCardsContent) { item in
                NewsletterCardView(item: item)
            }
        }
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
