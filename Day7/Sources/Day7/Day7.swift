import Foundation

struct Bag: Hashable {
    let color: String
    let containedBags: [String: Int]

    init(color: String, containedBags: [String: Int] = [:]) {
        self.color = color
        self.containedBags = containedBags
    }
}

extension Bag {
    init(string: String) {
        if string.contains("contain") {
            let parts = string
                .components(separatedBy: "contain")
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines)}
            let name = parts[0]
            let contents = parts[1]
            color = String(name.dropLast(" bags".count))
            var containedBags: [String: Int] = [:]
            guard contents != "no other bags." else {
                self.containedBags = containedBags
                return
            }
            for content in contents.components(separatedBy: ", ") {
                let amount = content.prefix(while: { $0 != " "})
                let name = content
                    .dropFirst(amount.count + 1)
                    .components(separatedBy: " bag")[0]
                containedBags[name] = Int(amount)!
            }
            self.containedBags = containedBags
        } else {
            fatalError()
        }
    }
}

extension Array where Element == Bag {
    func bagsThatContain(color: String) -> Set<String> {
        let directChildren = filter({ $0.containedBags.keys.contains(where: { $0 == color }) })

        let remainder = filter({ !directChildren.contains($0) })
        return Set(directChildren.map(\.color) + directChildren.map(\.color).flatMap { remainder.bagsThatContain(color: $0) })
    }

    func totalBags(inBagOf color: String) -> [Bag] {
        guard let bag = first(where: { $0.color == color }) else { fatalError() }

        var children: [Bag] = []
        for (color, amount) in bag.containedBags {
            let bags = totalBags(inBagOf: color)
            children += [[Bag]](repeating: bags, count: amount).flatMap { $0 }
        }
        return [bag] + children
    }
}
