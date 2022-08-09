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
            let splashViewModel = SplashViewModel()
            return AnyView(SplashView(splashViewModel: splashViewModel))
        case .startInbox:
            let inboxViewModel = InboxViewModel()
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
// /swiftlint:disable force_cast
// struct Navigator {
//    static func navigate<T: View>(to route: Route, content: () -> T) -> NavigationView<AnyView> {
//        switch route {
//        case .splash:
//            let splashViewModel = SplashViewModel()
//            return NavigationView { AnyView(SplashView(splashViewModel: splashViewModel)) }
//        case .startInbox:
//            let inboxViewModel = InboxViewModel()
//            return NavigationView {AnyView( InboxView(inboxViewModel: inboxViewModel)) }
//        case .discover:
//            let discoverViewModel = DiscoverViewModel()
//            return NavigationView { AnyView(NavigationLink(
//                destination: DiscoverView(discoverViewModel: discoverViewModel)) {
//                    content()
//                }) }
//        case .profile:
//            let profileViewModel = ProfileViewModel()
//            return NavigationView { AnyView(NavigationLink(
//                destination: ProfileView(profileViewModel: profileViewModel)) {
//                    content()
//                }) }
//        }
//    }
// }
// // swiftlint:enable force_cast
