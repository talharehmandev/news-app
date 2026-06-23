import Foundation

/**
 * NEWS REPOSITORY PROTOCOL
 * Defines the contract/interface for retrieving news data.
 * The Domain layer uses this interface, and the Data layer implements it.
 * This guarantees low coupling and enables easy mocking for unit tests.
 */
protocol NewsRepositoryProtocol {
    func getLatestArticles() async throws -> [Article]
    func searchArticles(query: String) async throws -> [Article]
}
