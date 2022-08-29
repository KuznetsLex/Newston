import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var isShowing = false
    let inboxViewModel: InboxViewModel
    init(inboxViewModel: InboxViewModel) {
        self.inboxViewModel = inboxViewModel
    }

    var toInbox: some View {
        Navigator.navigate(to: .startInbox, url: nil, content: { AnyView(_fromValue: (Any).self) })
    }

    let splashImage = Image("splashIcon")
}
