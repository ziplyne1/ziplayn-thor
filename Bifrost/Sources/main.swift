import Foundation

print("Hello, Bifrost")

let targetsData = try Data(contentsOf: URL(fileURLWithPath: "targets.json"))
let targets = try JSONDecoder().decode([Target].self, from: targetsData)

let manifestData = try Data(contentsOf: URL(fileURLWithPath: "manifest.json"))
let manifest = try JSONDecoder().decode([ManifestEntry].self, from: manifestData)


for target in targets {
    let id = target.id
    let entry = manifest.first(where: { $0.id == id })

    print("")
    print("---------------")
    print(id)
    print("  \(target.owner)/\(target.repo)")
    print("  \(target.filepattern)")
    print("  ")

    if let entry = entry {
        print("  \(entry.filename)")
        print("  \(entry.hash)")
        print("  \(entry.lastChecked)")
        print("  \(entry.lastUpdated)")
    } else {
        print("Couldn't find manifest entry for '\(id)")
    }

}