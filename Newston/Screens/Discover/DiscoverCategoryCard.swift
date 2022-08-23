import SwiftUI

protocol DiscoverCategoryCardDisplayable {
    var nameDisplayable: String { get }
    var logoDisplayable: String { get }
}

extension DiscoverCategoryCard: DiscoverCategoryCardDisplayable {
    var nameDisplayable: String { name }
    var logoDisplayable: String { logo }
}

struct DiscoverCategoryCardView: View {
    var item: DiscoverCategoryCard
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .font(.title)
            }
        }
        .padding()
    }
}
