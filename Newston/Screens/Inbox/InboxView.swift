import SwiftUI

struct InboxView: View {
    @ObservedObject var inboxViewModel: InboxViewModel
    init (inboxViewModel: InboxViewModel) {
        self.inboxViewModel = inboxViewModel
    }

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
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(inboxViewModel.unreadInfo)
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color("Gray"))
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
                        inboxViewModel.toDiscoverActionLink
                    }
                    Button {} label: {
                        inboxViewModel.toProfileActionLink
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

    var listOfInboxCards: some View {
            List(inboxViewModel.newsCardsContent) { item in
                NewsletterCardView(item: item)
                    .listRowBackground(Color("Gray_background"))
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .swipeActions(edge: .leading) {
                        Button {
                            inboxViewModel.toggleIssueRead()
                        }
                    label: {
                        Label("Read", systemImage: "envelope.open")
                    }
                    .background(RoundedRectangle(cornerRadius: 15).fill(.orange))
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            inboxViewModel.archiveIssue()
                        } label: {
                            Label("Archive", systemImage: "archivebox")
                        }
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
