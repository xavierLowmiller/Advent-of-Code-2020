final class RuleMatcher {

    enum Rule: Equatable {
        case literal(Substring)
        case rules([Int])
        case or([Int], [Int])
    }

    let lookup: [Int: Rule]

    init(string: String) {
        let lines = string.split(separator: "\n")
        var lookup: [Int: Rule] = [:]
        for line in lines {
            let index = Int(line.split(separator: ":")[0])!
            let remainder = line.split(separator: ":")[1]
            if line.contains("\"") {
                lookup[index] = .literal(remainder.split(separator: "\"")[1])
            } else if line.contains("|") {
                let parts = remainder.split(separator: "|")
                let rules1 = parts[0].split(separator: " ").compactMap { Int($0) }
                let rules2 = parts[1].split(separator: " ").compactMap { Int($0) }
                lookup[index] = .or(rules1, rules2)
            } else {
                let rules = remainder.split(separator: " ").compactMap { Int($0) }
                lookup[index] = .rules(rules)
            }

        }
        self.lookup = lookup
    }

    func isValidString(_ string: String) -> Bool {
        return matchString(string).contains("") == true
    }

    func matchString(_ string: String, ruleIndex: Int = 0) -> [String] {
        let rule = lookup[ruleIndex]!

        switch rule {
        case .literal(let prefix):
            if string.hasPrefix(prefix) {
                return [String(string.dropFirst(prefix.count))]
            } else {
                return []
            }

        case .rules(let rules):
            return checkMultipleRules(in: [string], rules: rules)

        case .or(let rules1, let rules2):
            return [
                checkMultipleRules(in: [string], rules: rules1),
                checkMultipleRules(in: [string], rules: rules2)
            ].flatMap { $0}
        }
    }

    private func checkMultipleRules(in strings: [String], rules: [Int]) -> [String] {
        guard let rule = rules.first else { return strings }

        let next = strings.flatMap { string in
            matchString(string, ruleIndex: rule)
        }
        return checkMultipleRules(in: next, rules: Array(rules.dropFirst()))
    }
}
