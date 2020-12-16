import Foundation

final class TicketValidator {
    private let validRanges: [String: [ClosedRange<Int>]]
    private let nearbyTickets: [[Int]]
    let ticket: [Int]

    init(string: String) {
        let parts = string.components(separatedBy: "\n\n")
        validRanges = parseRanges(from: parts[0])
        ticket = parts[1].components(separatedBy: "\n")[1].components(separatedBy: ",").compactMap(Int.init)
        nearbyTickets = parseNearbyTicket(from: parts[2])
    }

    var prettyTicket: [String: Int] {
        Dictionary(uniqueKeysWithValues: zip(descriptionOrder, ticket))
    }

    var descriptionOrder: [String] {
        var ordered: [Int: String] = [:]
        let byName = validTickets.map({ $0.map(possibleNames) })
        while ordered.count != validRanges.keys.count {
            for i in byName[0].indices {
                let a = byName.map { $0[i].filter { !ordered.values.contains($0) } }.reduce(into: Set(validRanges.keys)) { existing, new in
                    existing.formIntersection(new)
                }
                guard a.count == 1 else { continue }
                ordered[i] = a.first!
            }
        }
        return ordered.sorted(by: { $0.key < $1.key}).map(\.value)
    }

    func possibleNames(for number: Int) -> Set<String> {
        Set(validRanges.compactMap { (name, ranges) in
            if ranges.contains(where: { $0.contains(number) }) {
                return name
            } else {
                return nil
            }
        })
    }

    var validTickets: [[Int]] {
        nearbyTickets.filter({ ticket in
            ticket.allSatisfy({ number in
                validRanges.contains(where: { $0.value.flatMap({ $0 }).contains(number) })
            })
        })
    }

    var invalidNumbers: [Int] {
        nearbyTickets.flatMap({ $0 }).filter({ number in
            validRanges.allSatisfy({ !$0.value.flatMap({ $0 }).contains(number) })
        })
    }
}

private func parseRanges(from string: String) -> [String: [ClosedRange<Int>]] {
    Dictionary(uniqueKeysWithValues: string.components(separatedBy: "\n").map { line in
        let name = line.components(separatedBy: ":")[0]
        let ranges = line.components(separatedBy: " ").compactMap(ClosedRange.init)
        return (name, ranges)
    })
}

private func parseNearbyTicket(from string: String) -> [[Int]] {
    string.components(separatedBy: ":\n")[1].components(separatedBy: "\n").map {
        $0.components(separatedBy: ",").compactMap(Int.init)
    }
}

private extension ClosedRange where Bound == Int {
    init?(string: String) {
        let bounds = string.components(separatedBy: "-").compactMap(Int.init)
        guard bounds.count == 2 else { return nil }
        self = bounds[0]...bounds[1]
    }
}
