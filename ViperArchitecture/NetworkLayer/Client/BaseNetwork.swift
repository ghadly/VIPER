import UIKit
class BaseNetwork: NSObject {

    fileprivate override init() {}

    fileprivate static func config(_ URI: String) -> (request: URLRequest, session: URLSession) {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json", "Accept": "application/json", "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2MzExMywiY291bnRyeSI6InVzIiwiYnJhbmQiOiJtcyIsImlzcyI6Im1zIiwidHMiOjE1NTQzNzUyNTN9.Tr-G5RUQKvgCRzrAxUlesxf3ntdMJ0prQ_Z1yV_aAlw"]

        let session: URLSession = URLSession(configuration: config, delegate: nil, delegateQueue: nil)

        let params: [String: String] = ["brand":"ms",
                                        "client_id":"ios",
                                        "country":"us",
                                        "ios_appbuild":"0",
                                        "ios_appversion":"2.0.91",
                                        "ios_model":"Simulator",
                                        "ios_osversion":"12.1",
                                        "locale":"en-US",
                                        "token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2MzExMywiY291bnRyeSI6InVzIiwiYnJhbmQiOiJtcyIsImlzcyI6Im1zIiwidHMiOjE1NTQzNzUyNTN9.Tr-G5RUQKvgCRzrAxUlesxf3ntdMJ0prQ_Z1yV_aAlw",
                                        "ts":"1554477091",
                                        ]

        var request = URLRequest(url: URL(string: "\(URI)?\(params.stringFromHttpParameters())")!)
        request.httpMethod = "GET"
        return (request, session)
    }

    // swiftlint:disable function_parameter_count
    static func requestData(_ URI: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let configuration = BaseNetwork.config(URI)
        let dataTask = configuration.session.dataTask(with: configuration.request, completionHandler: { (data, response, error) in

                if (response as! HTTPURLResponse).statusCode >= 200 && (response as! HTTPURLResponse).statusCode < 300 {
                    DispatchQueue.main.async(execute: {
                        completion(data, response, error)
                    })
                } else {
                    var customError = error
                    if customError == nil && data != nil {
                        var json: [AnyHashable: Any] = [:]
                        do {
                            json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [AnyHashable: Any]
                        } catch let jsonerror as NSError {
                            print(jsonerror)
                        }
                        customError = NSError(domain: ((response as! HTTPURLResponse).url?.absoluteString)!, code: (response as! HTTPURLResponse).statusCode, userInfo: json as? [String: Any])
                    }

                    DispatchQueue.main.async(execute: {
                        completion(data, response, customError)
                    })
                }
        })
        dataTask.resume()
    }
    // swiftlint:enable function_parameter_count
}
