import SwiftUI
import Kingfisher

extension DiscoverCategoryCard {
    init(payload: DiscoverCategoriesPayload) {
        self.init(name: payload.name ?? "Unknown Category",
                  imageUrl: payload.imageUrl!)
    }
}

protocol DiscoverCategoryCardDisplayable {
    var nameDisplayable: String { get }
    var imageUrlDisplayable: String { get }
}

extension DiscoverCategoryCard: DiscoverCategoryCardDisplayable {
    var nameDisplayable: String { name }
    var imageUrlDisplayable: String { imageUrl }
}

struct DiscoverCategoryCardView: View {
    var item: DiscoverCategoryCardDisplayable

    var body: some View {
        Navigator.navigate(to: .discoverTechnology, url: nil) {

        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    KFImage(URL(string: item.imageUrlDisplayable))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                }
            }
            VStack {
                HStack {
                    Text(item.nameDisplayable)
                        .font(.custom("Helvetica Neue", size: 17, relativeTo: .headline))
                        .foregroundColor(.black)
                        .padding(16)
                    Spacer()
                }
                Spacer()
            }
        }
        .aspectRatio(191/112, contentMode: .fit)
        .background(.white)
        .cornerRadius(15)
    }
    }
}
