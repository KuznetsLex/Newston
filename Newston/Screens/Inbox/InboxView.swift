import SwiftUI

struct InboxView: View {
    @ObservedObject var inboxViewModel: InboxViewModel
    var body: some View {
        NavigationView {
            VStack {
                if inboxViewModel.isEditing {
                    navigationBarEditing
                } else {
                    navigationBarRegular
                }
                listOfInboxCards
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .background(Color("Gray_background"))
        }
    }
    var navigationBarRegular: some View {
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
                    inboxViewModel.isEditing.toggle()
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
        .foregroundColor(.black)
        .padding(.top, 18)
        .frame(maxWidth: .infinity)
    }
    var navigationBarEditing: some View {
        ZStack {
            HStack {
                Button {
                    inboxViewModel.isEditing.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                }
                Spacer()
            }
            Text(inboxViewModel.selectedInfo)
                .fontWeight(.semibold)
                .font(.custom("Helvetica Neue", size: 17, relativeTo: .headline))
        }
        .padding(.top, 18)
        .foregroundColor(.black)
    }

    var listOfInboxCards: some View {
        ZStack {
            List(inboxViewModel.newsCardsContent, selection: $inboxViewModel.selectedItems) { item in
                NewsletterCardView(item: item)
                    .listRowBackground(Color("Gray_background"))
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 4, leading: 0, bottom: 4, trailing: 0))
                    .swipeActions(edge: .leading) {
                        if item.isRead == false {
                            Button {
                                inboxViewModel.toggleIssueRead(for: item)
                            }
                        label: {
                            VStack {
                                Spacer()
                                Image("envelope.open")
                                Spacer()
                                Text("Read")
                                Spacer()
                            }
                        }
                        .tint(Color("Gray_swipes"))
                        } else {
                            Button {
                                inboxViewModel.toggleIssueRead(for: item)
                            }
                        label: {
                            VStack {
                                Spacer()
                                Image("envelope.closed")
                                Spacer()
                                Text("Unread")
                                Spacer()
                            }
                        }
                        .tint(Color("Black_1"))
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            inboxViewModel.archiveIssue(item)
                        } label: {
                            VStack {
                                Spacer()
                                Image("archive")
                                Spacer()
                                Text("Archive")
                                Spacer()
                            }                        }
                        .tint(Color("Black_1"))
                    }
            }
            .listStyle(.plain)
            .refreshable {
            }
            .environment(\.editMode, .constant(inboxViewModel.isEditing ? EditMode.active : EditMode.inactive))
            .animation(Animation.spring(), value: inboxViewModel.isEditing)

            if inboxViewModel.isEditing {
                VStack {
                    Spacer()
                    HStack {
                        Button {
                        } label: {
                            Text("Select all")
                                .fontWeight(.semibold)
                                .font(.custom("Helvetica Neue", size: 16, relativeTo: .callout))
                        }
                        Spacer()
                        Button {
                            inboxViewModel.archiveSelectedIssues()
                        } label: {
                            Text("Archive")
                                .fontWeight(.semibold)
                                .font(.custom("Helvetica Neue", size: 16, relativeTo: .callout))
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.bottom, 25)
                    .padding(.top, 20)
                    .padding(.horizontal, 12)
                    .background(.white)
                }
            }
        }
    }
}
