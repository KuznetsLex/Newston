import Alamofire

final class Api {
    let baseUrl: String

    init() {
        baseUrl = "https://virtserver.swaggerhub.com/ORGTEAM/newston_api/1.0.0"
    }

    func fetchInboxData(completion: @escaping (InboxPayload) -> Void) {
        AF.request(baseUrl + "/inbox")
            .responseDecodable(of: InboxPayload.self) { (response) in
                guard let json = response.value else { return }
                completion(json)
            }
    }

    func fetchDiscoverData(completion: @escaping ([DiscoverCategoriesPayload]) -> Void) {
        AF.request(baseUrl + "/discover")
            .responseDecodable(of: [DiscoverCategoriesPayload].self) { (response) in
                guard let json = response.value else { return }
                completion(json)
            }
    }

    func fetchDiscoverTechnology(completion: @escaping ([NewsletterInCategoryPayload]) -> Void) {
        AF.request(baseUrl + "/discover/technology")
            .responseDecodable(of: [NewsletterInCategoryPayload].self) { (response) in
                guard let json = response.value else { return }
                completion(json)
            }
    }

    func fetchNewsletterDescription(completion: @escaping ([NewsletterDescriptionPayload]) -> Void) {
        AF.request(baseUrl + "/newsletter/hacker")
            .responseDecodable(of: [NewsletterDescriptionPayload].self) { (response) in
                guard let json = response.value else { return }
                completion(json)
            }
    }
}
