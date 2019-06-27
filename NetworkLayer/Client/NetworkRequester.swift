import Foundation

public class NetworkRequester: BaseNetwork {
    fileprivate let apiHost = "https://staging.api.marleyspoon.com/"

    public override init() {
        super.init()
    }
    
    public func getRecipes(completion:@escaping  (Data?, URLResponse?, Error?) -> Void) {
        let uri = "\(apiHost)recipes.json"
        requestData(uri,completion: completion)
    }
}
