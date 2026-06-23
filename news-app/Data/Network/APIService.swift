import Foundation

/**
 * NETWORK ERRORS
 */
enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case badStatusCode(Int)
    case decodingError(Error)
    case requestFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The URL is invalid."
        case .invalidResponse: return "Received invalid response from the server."
        case .badStatusCode(let code): return "Server returned a bad status code: \(code)."
        case .decodingError(let err): return "Failed to decode response: \(err.localizedDescription)"
        case .requestFailed(let err): return "Network request failed: \(err.localizedDescription)"
        }
    }
}

/**
 * API SERVICE
 * Lightweight networking client utilizing async/await Swift Concurrency.
 */
class APIService {
    static let shared = APIService()
    private init() {}
    
    // Generic fetch request function
    func fetch<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.badStatusCode(httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            // Setting up standard ISO8601 date parsing for API consistency
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
