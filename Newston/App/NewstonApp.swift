import SwiftUI

@main
struct Newston: App {
    var body: some Scene {
        WindowGroup {

            Navigator.navigate(to: .splash, content: { EmptyView() })
        }
    }
}
