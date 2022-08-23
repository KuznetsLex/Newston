import Alamofire

final class Api {
    func fetchInboxData(completion: @escaping (InboxPayload) -> Void) {
        AF.request("https://virtserver.swaggerhub.com/ORGTEAM/newston_api/1.0.0/inbox", headers: nil)
            .responseDecodable(of: InboxPayload.self) { (response) in
                guard let json = response.value else { return }
                completion(json)
            }
    }

}
