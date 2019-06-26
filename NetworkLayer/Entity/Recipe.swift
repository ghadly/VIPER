import Foundation

public struct Recipes: Codable {
    public var data: [Recipe]
}

public struct Recipe: Codable {
    public var id: Int!
    public var country: String!
    public var name: String!
    public var subtitle: String?
    public var photoUrlMedium: String!
    public var classic: Bool!
}
