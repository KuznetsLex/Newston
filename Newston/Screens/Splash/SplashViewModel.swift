import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var isShowing = false
    let inboxViewModel = InboxViewModel()
}
