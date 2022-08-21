import SwiftUI
import Kingfisher
struct FitToAspectSquare: ViewModifier {

    public func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color(.clear))
                .aspectRatio(1, contentMode: .fit)

            content
                .scaledToFill()
                .layoutPriority(-1)
        }
        .clipped()
    }
}

public extension KFImage {
    func fitToSquare() -> some View {
        self.resizable().modifier(FitToAspectSquare())
    }

}
