import SwiftUI

enum Route {
    case splash
    case startInbox
    case issue
    case discover
    case profile
}

struct Navigator {
    static func navigate<T: View>(to route: Route, url: String?, content: () -> T) -> some View {
        switch route {
        case .splash:
            let inboxViewModel = InboxViewModel(api: Api())
            let splashViewModel = SplashViewModel(inboxViewModel: inboxViewModel)
            return AnyView(SplashView(splashViewModel: splashViewModel))
        case .startInbox:
            let inboxViewModel = InboxViewModel(api: Api())
            return AnyView(InboxView(inboxViewModel: inboxViewModel))
        case .issue:
            return AnyView(
                ZStack {
                    NavigationLink(destination:
                            IssueWebView(url: url!)) {
                            EmptyView()
                        }
                        .opacity(0)
                        .buttonStyle(PlainButtonStyle())
                    content()
                })
        case .discover:
            let discoverViewModel = DiscoverViewModel()
            return AnyView(
                ZStack {
                    NavigationLink(destination:
                        DiscoverView(discoverViewModel: discoverViewModel)) {
                            EmptyView()
                        }
                        .opacity(0)
                        .buttonStyle(PlainButtonStyle())
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
