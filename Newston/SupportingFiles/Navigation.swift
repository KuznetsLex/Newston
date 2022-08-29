import SwiftUI

enum Route {
    case splash
    case startInbox
    case issue
    case discover
    case discoverTechnology
    case discoverDescription
    case profile
}

struct Navigator {
    static func navigate<T: View>(to route: Route, url: String?, content: () -> T) -> some View {
        let api = Api()
        switch route {
        case .splash:
            let inboxViewModel = InboxViewModel(api: api)
            let splashViewModel = SplashViewModel(inboxViewModel: inboxViewModel)
            return AnyView(SplashView(splashViewModel: splashViewModel))
        case .startInbox:
            let inboxViewModel = InboxViewModel(api: api)
            return AnyView(InboxView(inboxViewModel: inboxViewModel))
        case .issue:
            return AnyView(
                ZStack {
                    NavigationLink(destination:
                            IssueWebView(url: url!)) { EmptyView() }
                        .opacity(0)
                        .buttonStyle(PlainButtonStyle())
                    content()
                })
        case .discover:
            let discoverViewModel = DiscoverViewModel(api: api)
            return AnyView(NavigationLink(destination: DiscoverView(discoverViewModel: discoverViewModel)) {
                    content()
                })
        case .discoverTechnology:
            let technologyCategoryViewModel = TechnologyCategoryViewModel(api: api)
            return AnyView(NavigationLink(
                destination: TechnologyCategoryView(technologyCategoryViewModel: technologyCategoryViewModel)) {
                    content()
                })
        case .discoverDescription:
            let newsletterDescriptionViewModel = NewsletterDescriptionViewModel(api: api)
            return AnyView(
                ZStack {
                    NavigationLink(destination:
                            NewsletterDescriptionView(newsletterDescriptionViewModel: newsletterDescriptionViewModel)) {
                            EmptyView()
                        }
                        .opacity(0)
                        .buttonStyle(PlainButtonStyle())
                    content()
                })
        case .profile:
            let profileViewModel = ProfileViewModel()
            return AnyView(NavigationLink(destination: ProfileView(profileViewModel: profileViewModel)) {
                    content()
                })
        }
    }
}
