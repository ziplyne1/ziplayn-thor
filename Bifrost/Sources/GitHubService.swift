import Foundation

#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

enum GitHubServiceError: Error {
    case requestFailed(statusCode: Int)
    case decodingFailed(Error)
    case noAssetsFound
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

struct GitHubRepo {
    let owner: String
    let repo: String
}

struct GitHubService {
    let token: String? = ProcessInfo.processInfo.environment["GITHUB_TOKEN"]
    let session = URLSession.shared


    func createRequest(
        method: HTTPMethod,
        endpoint: String,
        headers: [String: String] = [:]
    ) throws -> URLRequest {
        guard let url = URL(string: "https://api.github.com\(endpoint)") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        for key in headers.keys {
            request.addValue(headers[key]!, forHTTPHeaderField: key)
        }

        return request
    }


    func octocat() async -> String {
        do {
            let request = try createRequest(
                method: .get,
                endpoint: "/octocat",
                headers: [
                    "Accept": "application/vnd.github+json",
                    "X-GitHub-Api-Version": "2022-11-28",
                ]
            )
            let response = try await session.data(for: request)

            return String(data: response.0, encoding: .utf8)
                ?? "Couldn't read the data from the URLResponse!"
        } catch {
            return error.localizedDescription
        }
    }
    
    func findLatestReleaseId(for repo: GitHubRepo) -> String {
        // todo
        return ""
    }
}
