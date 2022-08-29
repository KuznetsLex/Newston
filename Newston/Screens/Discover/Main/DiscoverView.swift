import SwiftUI

struct DiscoverView: View {
    @ObservedObject var discoverViewModel: DiscoverViewModel
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                    ForEach(discoverViewModel.categoryCards, id: \.self) { item in
                        DiscoverCategoryCardView(item: item)
                    }
                }
                .padding(.horizontal, 12)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(discoverViewModel.title)
            .background(Color("Gray_background"))
    }
}
