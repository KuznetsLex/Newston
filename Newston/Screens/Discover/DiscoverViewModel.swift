import SwiftUI

class DiscoverViewModel: ObservableObject {
    let title = "Discover"

    let firstSubtitle = "POPULAR NEWSLETTERS"

    let secondSubtitle = "CATEGORIES"

    @Published var discoverCardContent = [
        DiscoverPopularCard(name: "Hacker News",
                            summary: "Programming and technologies",
                            authorLogoName: "Hacker News",
                            isSubscribed: false),
        DiscoverPopularCard(name: "Medium Daily Digest",
                            summary: "Collection of stories",
                            authorLogoName: "Medium Daily Digest",
                            isSubscribed: false),
        DiscoverPopularCard(name: "New York Time",
                            summary: "Cityscapes of news",
                            authorLogoName: "New York Time",
                            isSubscribed: false),
        DiscoverPopularCard(name: "not boring",
                            summary: "Breaking down companies,",
                            authorLogoName: "not boring",
                            isSubscribed: false),
        DiscoverPopularCard(name: "The Bulwark",
                            summary: "Political analysis and reporting",
                            authorLogoName: "The Bulwark",
                            isSubscribed: false),
        DiscoverPopularCard(name: "The Fifth Column",
                            summary: "Secret sympathizers or supporters",
                            authorLogoName: "The Fifth Column",
                            isSubscribed: false),
        DiscoverPopularCard(name: "Android Weekly",
                            summary: "Stay cutting-edge with your Android Development",
                            authorLogoName: "Android Weekly",
                            isSubscribed: false)
    ]

    let categoryCardContent = [
        DiscoverCategoryCard(name: "Technology",
                             logo: ""),
        DiscoverCategoryCard(name: "Programming",
                             logo: ""),
        DiscoverCategoryCard(name: "Design",
                             logo: ""),
        DiscoverCategoryCard(name: "Travel",
                             logo: ""),
        DiscoverCategoryCard(name: "Cooking",
                             logo: ""),
        DiscoverCategoryCard(name: "Media",
                             logo: ""),
        DiscoverCategoryCard(name: "Music",
                             logo: ""),
        DiscoverCategoryCard(name: "Healthcare",
                             logo: "")
    ]
}
