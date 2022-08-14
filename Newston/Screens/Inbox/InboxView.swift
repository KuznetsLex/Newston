import SwiftUI

struct InboxView: View {
    @ObservedObject var inboxViewModel: InboxViewModel
    var body: some View {
        NavigationView {
            VStack {
                navigationBar
                listOfInboxCards
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .background(Color("Gray_background"))
        }
    }
    var navigationBar: some View {
            ZStack {
                VStack(spacing: 0.0) {
                    Text(inboxViewModel.title)
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica Neue", size: 17, relativeTo: .headline))
                    Text(inboxViewModel.unreadInfo)
                        .foregroundColor(Color("Gray"))
                        .font(.custom("Helvetica Neue", size: 14, relativeTo: .subheadline))
                }
                HStack(spacing: 0) {
                    Button {
                        // MARK: todo
                    } label: {
                        Text("Edit")
                            .font(.custom("Helvetica Neue", size: 17, relativeTo: .headline))
                            .padding(.horizontal, 12)

                    }
                    Spacer()
                    Button {} label: {
                        inboxViewModel.toDiscoverActionLink
                    }
                    Button {} label: {
                        inboxViewModel.toProfileActionLink
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                }
            }
            .font(.title2)
            .foregroundColor(.black)
            .padding(.top, 18)
            .frame(maxWidth: .infinity)

    }

    var listOfInboxCards: some View {
            List(inboxViewModel.newsCardsContent) { item in
                NewsletterCardView(item: item)
                    .listRowBackground(Color("Gray_background"))
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 4, leading: 0, bottom: 4, trailing: 0))
                    .swipeActions(edge: .leading) {
                        Button {
                            inboxViewModel.toggleIssueRead()
                        }
                    label: {
                        Label("Read", systemImage: "envelope.open")
                    }
                    .tint(Color("Gray_swipes"))
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            inboxViewModel.archiveIssue()
                        } label: {
                            Label("Archive", systemImage: "archivebox")
                        }
                        .tint(Color("Black_swipes"))
                    }
            }
            .listStyle(.plain)

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
