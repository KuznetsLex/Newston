import SwiftUI

struct DiscoverView: View {
    @ObservedObject var discoverViewModel: DiscoverViewModel
    var body: some View {
        VStack {
            navigationBar
            popularNewsletters
            categories
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .background(Color("Gray_background"))
    }

    var navigationBar: some View {
        let discoverViewModel = DiscoverViewModel()
        return Text(discoverViewModel.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.top, 12)
                    .padding(.bottom, 31)
    }

    var popularNewsletters: some View {
        let discoverViewModel = DiscoverViewModel()
        return VStack {
            HStack {
                Text(discoverViewModel.firstSubtitle)
                    .padding(.leading, 29)
                    .font(.footnote)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
                Spacer()
                Button {} label: {
                    Text("SEE ALL")
                        .padding(.trailing, 12)
                }
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(discoverViewModel.discoverCardContent) { item in
                        DiscoverPopularCardView(item: item)
                    }
                }
            }
        }
    }

    var categories: some View {
        let discoverViewModel = DiscoverViewModel()
        return VStack {
            HStack {
                Text(discoverViewModel.secondSubtitle)
                    .padding(.leading, 29)
                    .font(.footnote)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("Gray")/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.fixed(4.0))]) {
                    ForEach(discoverViewModel.categoryCardContent) { item in
                        DiscoverCategoryCardView(item: item)
                    }
                }
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        let discoverViewModel = DiscoverViewModel()
        DiscoverView(discoverViewModel: discoverViewModel)
    }
}
