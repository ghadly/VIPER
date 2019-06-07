import Foundation

struct Recipes: Codable {
    var data: [Recipe]
}

struct Recipe: Codable {
    var id: Int!
    var country: String!
    var name: String!
    var subtitle: String?
    var photoUrlMedium: String!
    var classic: Bool!
}
