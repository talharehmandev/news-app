import Foundation

/**
 * ARTICLE MODEL
 * A standard data entity representing a news article.
 * Conforms to Codable for easy JSON parsing and Identifiable/Hashable for SwiftUI lists.
 */
struct Article: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let description: String?
    let content: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let sourceName: String
    
    // CodingKeys allows mapping JSON properties (like snake_case or specific naming) to camelCase Swift properties
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case content
        case url
        case urlToImage
        case publishedAt
        case sourceName = "source"
    }
    
    // Custom decoder helper for nested source names or custom date parsing
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.url = try container.decode(String.self, forKey: .url)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        
        // Handle dates: parse ISO8601 or fall back to current date
        let dateString = try container.decode(String.self, forKey: .publishedAt)
        let formatter = ISO8601DateFormatter()
        self.publishedAt = formatter.date(from: dateString) ?? Date()
        
        // If the source key is a nested dictionary, decode it, otherwise fall back to string
        if let sourceDict = try? container.decode([String: String].self, forKey: .sourceName) {
            self.sourceName = sourceDict["name"] ?? "Unknown"
        } else {
            self.sourceName = try container.decodeIfPresent(String.self, forKey: .sourceName) ?? "Unknown"
        }
    }
    
    // Simple custom initializer for preview/test mock data
    init(id: String = UUID().uuidString, title: String, description: String?, content: String?, url: String, urlToImage: String?, publishedAt: Date = Date(), sourceName: String) {
        self.id = id
        self.title = title
        self.description = description
        self.content = content
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.sourceName = sourceName
    }
}
