import Foundation

struct Target: Codable {
    let id: String
    let owner: String
    let repo: String
    let filepattern: String
}

struct ManifestEntry: Codable {
    let id: String
    let filename: String
    let hash: String
    let lastChecked: String
    let lastUpdated: String
}