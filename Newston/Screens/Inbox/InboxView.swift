import SwiftUI
struct InboxView: View {
    @ObservedObject var inboxViewModel: InboxViewModel
    var body: some View {
        NavigationView {
            VStack {
                navigationBar// .padding(.bottom, 16)
                ScrollingIssues()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .background(Color("Gray_background"))
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

}

struct ScrollingIssues: View {
    let inboxViewModel = InboxViewModel()
    var body: some View {
        List(inboxViewModel.newsCardsContent) { item in
            NewsletterCardView(item: item)
                .listRowBackground(Color("Gray_background"))
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .swipeActions(edge: .leading) {
                    Button {
                        inboxViewModel.toggleIssueRead()
                    } label: {
                        VStack {
                            Spacer()
                            Image(systemName: "envelope")
                            Spacer()
                            Text("Read")
                                .font(.body)
                            Spacer()
                        }
                    }
                }

                .swipeActions(edge: .trailing) {
                    Button {
                        inboxViewModel.archiveIssue()
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
    //        .toolbar {
    //            ToolbarItem { EditButton() }
    //        }
}
struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        let inboxViewModel = InboxViewModel()
        InboxView(inboxViewModel: inboxViewModel)
            .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portrait)
    }
}
