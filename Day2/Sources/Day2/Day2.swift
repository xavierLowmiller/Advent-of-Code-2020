import Foundation

extension StringProtocol {
    var isValidPasswordInPart1: Bool {
        let elements = split(separator: ":")
        let validator = elements[0].split(separator: " ")
        let letter = Character(String(validator[1]))
        let amountRange = validator[0].split(separator: "-").map { Int($0)! }

        let password = elements[1].trimmingCharacters(in: .whitespaces)

        let letters = Dictionary(grouping: password) { $0 }.mapValues(\.count)

        guard let count = letters[letter] else { return false }

        return amountRange[0]...amountRange[1] ~= count
    }

    var isValidPasswordInPart2: Bool {
        let elements = split(separator: ":")
        let validator = elements[0].split(separator: " ")
        let letter = Character(String(validator[1]))
        let indices = validator[0]
            .split(separator: "-")
            .map { Int($0)! }
            .map { $0 - 1 }

        let password = Array(elements[1].trimmingCharacters(in: .whitespaces))

        return (password[indices[0]] == letter) != (password[indices[1]] == letter)
    }
}
