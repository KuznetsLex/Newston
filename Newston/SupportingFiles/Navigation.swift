import SwiftUI

enum Route {
    case splash
    case startInbox
    case discover
    case profile
}

struct Navigator {
    static func navigate<T: View>(to route: Route, content: () -> T) -> some View {
        switch route {
        case .splash:
            let inboxViewModel = InboxViewModel(api: Api())
            let splashViewModel = SplashViewModel(inboxViewModel: inboxViewModel)
            return AnyView(SplashView(splashViewModel: splashViewModel))
        case .startInbox:
            let inboxViewModel = InboxViewModel(api: Api())
            return AnyView(InboxView(inboxViewModel: inboxViewModel))
        case .discover:
            let discoverViewModel = DiscoverViewModel()
            return AnyView(NavigationLink(
                destination: DiscoverView(discoverViewModel: discoverViewModel)) {
                    content()
                })
        case .profile:
            let profileViewModel = ProfileViewModel()
            return AnyView(NavigationLink(
                destination: ProfileView(profileViewModel: profileViewModel)) {
                    content()
                })
        }
    }
}
