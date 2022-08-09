import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var isShowing = false
    let inboxViewModel = InboxViewModel()

    var toInbox: some View {
        Navigator.navigate(to: .startInbox, content: { AnyView(_fromValue: (Any).self) })
    }

    let splashImage = Image("splashImage")
}
