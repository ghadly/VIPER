import Foundation

enum AddOnOperation {
    case enableAddOn
    case deleteAddOn
}
class NetworkRequester: BaseNetwork {
    fileprivate static let apiHost = "https://staging.api.marleyspoon.com/"

    static func getRecipes(completion:@escaping  (Data?, URLResponse?, Error?) -> Void) {
        let uri = "\(apiHost)recipes.json"
        requestData(uri,completion: completion)
    }
}
