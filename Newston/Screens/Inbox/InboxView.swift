import SwiftUI

let inboxViewModel = InboxViewModel()
let listOfInboxCards = InboxView.ListOfInboxCards(inboxViewModel: inboxViewModel)
let navigationBar = InboxView.NavigationBar(inboxViewModel: inboxViewModel)

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
    struct NavigationBar: View {
        private let inboxViewModel: InboxViewModel
        init (inboxViewModel: InboxViewModel) {
            self.inboxViewModel = inboxViewModel
        }
        var body: some View {
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
                        inboxViewModel.toDiscover
                    }
                    Button {} label: {
                        inboxViewModel.toProfile
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
    }

    struct ListOfInboxCards: View {
        private let inboxViewModel: InboxViewModel
        init (inboxViewModel: InboxViewModel) {
            self.inboxViewModel = inboxViewModel
        }

        var body: some View {
            List(inboxViewModel.newsCardsContent) { item in
                NewsletterCardView(item: item)
                    .listRowBackground(Color("Gray_background"))
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .swipeActions(edge: .leading) {
                        Button {
                            self.inboxViewModel.toggleIssueRead()
                        }
                    label: {
                        Label("Read", systemImage: "envelope.open")
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    .tint(.orange)

                    .swipeActions(edge: .trailing) {
                        Button {
                            self.inboxViewModel.archiveIssue()
                        } label: {
                            VStack {
                                Spacer()
                                Image(systemName: "archivebox")
                                Spacer()
                                Text("Archive")
                                    .font(.body)
                                Spacer()
                            }
                        }
                    }

            }
        }
        //    .toolbar {
        //        ToolbarItem { EditButton() }
        //    }
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
