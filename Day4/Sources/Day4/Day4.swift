import Foundation

struct Passport {
    private let values: [String: String]
    init<S: StringProtocol>(string: S) {
        values = Dictionary(uniqueKeysWithValues: string
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .map { pair in
                let key = pair.split(separator: ":")[0]
                let value = pair.split(separator: ":")[1]
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                return (String(key), String(value))
            })
    }

    var isValidPart1: Bool {
        let requiredKeys: Set<String> = [
            "byr",
            "iyr",
            "eyr",
            "hgt",
            "hcl",
            "ecl",
            "pid",
//            "cid"
        ]

        let intersection = Set(values.keys).intersection(requiredKeys)
        return intersection.count == requiredKeys.count
    }

    var isValidPart2: Bool {
        guard let birthYear = values["byr"].flatMap(Int.init),
              1920...2002 ~= birthYear
        else { return false }

        guard let issueYear = values["iyr"].flatMap(Int.init),
              2010...2020 ~= issueYear
        else { return false }

        guard let expirationYear = values["eyr"].flatMap(Int.init),
              2020...2030 ~= expirationYear
        else { return false }

        guard let height = values["hgt"] else { return false }
        if height.hasSuffix("cm") {
            guard let heightCM = Int(height.dropLast(2)),
                  150...193 ~= heightCM
            else { return false }
        } else if height.hasSuffix("in") {
            guard let heightIN = Int(height.dropLast(2)),
                  59...76 ~= heightIN
            else { return false }
        } else {
            return false
        }

        let hairColorRegex = try! NSRegularExpression(pattern: ##"^#([a-f]|\d){6}$"##)
        guard let hairColor = values["hcl"], hairColorRegex.matches(in: hairColor, range: NSRange(0..<hairColor.count)).count == 1
        else { return false }

        let validEyeColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
        guard let eyeColor = values["ecl"], validEyeColors.contains(eyeColor)
        else { return false }

        let passportIDRegex = try! NSRegularExpression(pattern: #"^\d{9}$"#)
        guard let passportID = values["pid"], passportIDRegex.matches(in: passportID, range: NSRange(0..<passportID.count)).count == 1
        else { return false }

        return true
    }
}
