import Foundation

public class NetworkRequester: BaseNetwork {
    fileprivate static let apiHost = "https://staging.api.marleyspoon.com/"

    public static func getRecipes(completion:@escaping  (Data?, URLResponse?, Error?) -> Void) {
        let uri = "\(apiHost)recipes.json"
        requestData(uri,completion: completion)
    }
}
