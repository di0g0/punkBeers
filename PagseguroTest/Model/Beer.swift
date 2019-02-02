import Foundation

struct Beer : Codable {
    let name: String
    let imageUrl: String
    let description: String
    let tagline: String
    let abv: Float
    let ibu: Float?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "image_url"
        case description
        case tagline
        case abv
        case ibu
    }
}
