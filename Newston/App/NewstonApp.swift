import SwiftUI

@main
struct Newston: App {
    var body: some Scene {
        WindowGroup {
            Navigator.navigate(to: .splash, url: nil, content: { EmptyView() })
        }
    }
}
