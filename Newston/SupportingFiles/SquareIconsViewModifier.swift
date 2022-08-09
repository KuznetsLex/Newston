import SwiftUI
/// Common aspect ratios

/// Fit an image to a certain aspect ratio while maintaining its aspect ratio
public struct FitToAspectSquare: ViewModifier {

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

// Image extension that composes with the .resizable() modifier
public extension Image {
    func fitToSquare() -> some View {
        self.resizable().modifier(FitToAspectSquare())
    }

}
