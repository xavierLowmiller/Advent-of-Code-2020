import Foundation

struct Match: Comparable {
    let range: Range<String.Index>
    let replacement: Int

    static func < (lhs: Match, rhs: Match) -> Bool {
        lhs.range.lowerBound < rhs.range.lowerBound
    }
}

func simplifyExpressionPart1(_ expression: String) -> Int {
    if let int = Int(expression) { return int }

    var expression = expression

    var plusMatch: Match?
    var mulitplyMatch: Match?

    let plusRegex = try! NSRegularExpression(pattern: #"(?<i1>\d+\b) \+ (?<i2>\d+\b)"#)
    let plusRange = NSRange(expression.startIndex..<expression.endIndex, in: expression)
    if let match = plusRegex.firstMatch(in: expression, range: plusRange) {
        let i1 = Int(expression[Range(match.range(withName: "i1"), in: expression)!])!
        let i2 = Int(expression[Range(match.range(withName: "i2"), in: expression)!])!

        plusMatch = Match(range: Range(match.range, in: expression)!, replacement: i1 + i2)
    }

    let multiplyRegex = try! NSRegularExpression(pattern: #"(?<i1>\d+\b) \* (?<i2>\d+\b)"#)
    let multiplyRange = NSRange(expression.startIndex..<expression.endIndex, in: expression)
    if let match = multiplyRegex.firstMatch(in: expression, range: multiplyRange) {
        let i1 = Int(expression[Range(match.range(withName: "i1"), in: expression)!])!
        let i2 = Int(expression[Range(match.range(withName: "i2"), in: expression)!])!

        mulitplyMatch = Match(range: Range(match.range, in: expression)!, replacement: i1 * i2)
    }

    switch (plusMatch, mulitplyMatch) {
    case let (plusMatch?, mulitplyMatch?):
        let match = min(plusMatch, mulitplyMatch)
        expression.replaceSubrange(match.range, with: "\(match.replacement)")
    case (let match?, nil):
        expression.replaceSubrange(match.range, with: "\(match.replacement)")
    case (nil, let match?):
        expression.replaceSubrange(match.range, with: "\(match.replacement)")
    case (nil, nil):
        break
    }

    let parensRegex = try! NSRegularExpression(pattern: #"\((?<i1>\d+)\)"#)
    let parensRange = NSRange(expression.startIndex..<expression.endIndex, in: expression)
    if let match = parensRegex.firstMatch(in: expression, range: parensRange) {
        let i1 = Int(expression[Range(match.range(withName: "i1"), in: expression)!])!

        expression.replaceSubrange(Range(match.range, in: expression)!, with: "\(i1)")
    }

    return simplifyExpressionPart1(expression)
}

func simplifyExpressionPart2(_ expression: String) -> Int {
    Int(simplifyExpressionPart2String(expression))!
}

func simplifyExpressionPart2String(_ expression: String) -> String {
    if expression.allSatisfy(\.isNumber) { return expression }

    let range = NSRange(expression.startIndex..<expression.endIndex, in: expression)
    var expression = expression

    let parensRegex = try! NSRegularExpression(pattern: #"^\([^\(\)]*\)$"#)
    if parensRegex.firstMatch(in: expression, range: range) != nil {
        return simplifyExpressionPart2String(String(expression.dropFirst().dropLast()))
    }

    let insideParensRegex = try! NSRegularExpression(pattern: #"\([^\(\)]*\)"#)
    if let match = insideParensRegex.firstMatch(in: expression, range: range) {

        let substring = expression[Range(match.range, in: expression)!]

        let replacement = simplifyExpressionPart2String(String(substring))

        expression.replaceSubrange(Range(match.range, in: expression)!, with: replacement)
        return simplifyExpressionPart2String(expression)
    }

    let plusRegex = try! NSRegularExpression(pattern: #"(?<i1>\d+\b) \+ (?<i2>\d+\b)"#)
    if let match = plusRegex.firstMatch(in: expression, range: range) {
        let i1 = Int(expression[Range(match.range(withName: "i1"), in: expression)!])!
        let i2 = Int(expression[Range(match.range(withName: "i2"), in: expression)!])!

        expression.replaceSubrange(Range(match.range, in: expression)!, with: "\(i1 + i2)")
        return simplifyExpressionPart2String(expression)
    }

    let multiplyRegex = try! NSRegularExpression(pattern: #"(?<i1>\d+\b) \* (?<i2>\d+\b)"#)
    if let match = multiplyRegex.firstMatch(in: expression, range: range) {
        let i1 = Int(expression[Range(match.range(withName: "i1"), in: expression)!])!
        let i2 = Int(expression[Range(match.range(withName: "i2"), in: expression)!])!

        expression.replaceSubrange(Range(match.range, in: expression)!, with: "\(i1 * i2)")
        return simplifyExpressionPart2String(expression)
    }

    fatalError()
}
