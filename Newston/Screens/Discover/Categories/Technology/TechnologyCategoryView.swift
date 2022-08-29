import SwiftUI

struct TechnologyCategoryView: View {
    @ObservedObject var technologyCategoryViewModel: TechnologyCategoryViewModel
    var body: some View {
            List(technologyCategoryViewModel.newsletters) { item in
                NewsletterView(item: item)
                    .listRowBackground(Color("Gray_background"))
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 4, leading: 0, bottom: 4, trailing: 0))
            }
            .refreshable {
                technologyCategoryViewModel.fetchNewsletterCards()
            }

        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(technologyCategoryViewModel.title)
        .background(Color("Gray_background"))
    }
}
