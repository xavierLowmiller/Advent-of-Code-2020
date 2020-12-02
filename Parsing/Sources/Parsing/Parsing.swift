import Foundation

public struct Parser<Input, Output> {
  public let run: (inout Input) -> Output?
}

public extension Parser where Input == [String: String] {
  static func key(_ key: String, _ parser: Parser<Substring, Output>) -> Self {
    Self { dict in
      guard var value = dict[key]?[...]
      else { return nil }

      guard let output = parser.run(&value)
      else { return nil }

      dict[key] = value.isEmpty ? nil : String(value)
      return output
    }
  }
}

public extension Parser where Input == Substring, Output == Substring {
  static var rest: Self {
//    Self.prefix(while: { _ in true })
    Self { input in
      let rest = input
      input = ""
      return rest
    }
  }
}

public extension Parser {
  func run(_ input: Input) -> (match: Output?, rest: Input) {
    var input = input
    let match = self.run(&input)
    return (match, input)
  }
}

public extension Parser where Input == Substring, Output == Int {
  static let int = Self { input in
    let original = input

    var isFirstCharacter = true
    let intPrefix = input.prefix { character in
      defer { isFirstCharacter = false }
      return (character == "-" || character == "+") && isFirstCharacter
        || character.isNumber
    }

    guard let match = Int(intPrefix)
    else {
      input = original
      return nil
    }
    input.removeFirst(intPrefix.count)
    return match
  }
}


public extension Parser where Input == Substring, Output == Double {
  static let double = Self { input in
    let original = input
    let sign: Double
    if input.first == "-" {
      sign = -1
      input.removeFirst()
    } else if input.first == "+" {
      sign = 1
      input.removeFirst()
    } else {
      sign = 1
    }

    var decimalCount = 0
    let prefix = input.prefix { char in
      if char == "." { decimalCount += 1 }
      return char.isNumber || (char == "." && decimalCount <= 1)
    }

    guard let match = Double(prefix)
    else {
      input = original
      return nil
    }

    input.removeFirst(prefix.count)
    return match * sign
  }
}


public extension Parser where Input == Substring, Output == Character {
  static let char = Self { input in
    guard !input.isEmpty else { return nil }
    return input.removeFirst()
  }
}

public extension Parser {
  static func always(_ output: Output) -> Self {
    Self { _ in output }
  }

  static var never: Self {
    Self { _ in nil }
  }
}

public extension Parser {
  func map<NewOutput>(_ f: @escaping (Output) -> NewOutput) -> Parser<Input, NewOutput> {
    .init { input in
      self.run(&input).map(f)
    }
  }
}

public extension Parser {
  func flatMap<NewOutput>(
    _ f: @escaping (Output) -> Parser<Input, NewOutput>
  ) -> Parser<Input, NewOutput> {
    .init { input in
      let original = input
      let output = self.run(&input)
      let newParser = output.map(f)
      guard let newOutput = newParser?.run(&input) else {
        input = original
        return nil
      }
      return newOutput
    }
  }
}

func zip<Input, Output1, Output2>(
  _ p1: Parser<Input, Output1>,
  _ p2: Parser<Input, Output2>
) -> Parser<Input, (Output1, Output2)> {

  .init { input -> (Output1, Output2)? in
    let original = input
    guard let output1 = p1.run(&input) else { return nil }
    guard let output2 = p2.run(&input) else {
      input = original
      return nil
    }
    return (output1, output2)
  }
}

public extension Parser {
  static func oneOf(_ ps: [Self]) -> Self {
    .init { input in
      for p in ps {
        if let match = p.run(&input) {
          return match
        }
      }
      return nil
    }
  }

  static func oneOf(_ ps: Self...) -> Self {
    self.oneOf(ps)
  }
}

public extension Parser {
  func zeroOrMore(
    separatedBy separator: Parser<Input, Void> = .always(())
  ) -> Parser<Input, [Output]> {
    Parser<Input, [Output]> { input in
      var rest = input
      var matches: [Output] = []
      while let match = self.run(&input) {
        rest = input
        matches.append(match)
        if separator.run(&input) == nil {
          return matches
        }
      }
      input = rest
      return matches
    }
  }
}

public extension Parser
where Input: Collection,
      Input.SubSequence == Input,
      Output == Void,
      Input.Element: Equatable {
  static func prefix(_ p: Input.SubSequence) -> Self {
    Self { input in
      guard input.starts(with: p) else { return nil }
      input.removeFirst(p.count)
      return ()
    }
  }
}

public extension Parser where Input == Substring, Output == Substring {
  static func prefix(while p: @escaping (Character) -> Bool) -> Self {
    Self { input in
      let output = input.prefix(while: p)
      input.removeFirst(output.count)
      return output
    }
  }

  static func prefix(upTo substring: Substring) -> Self {
    Self { input in
      guard let endIndex = input.range(of: substring)?.lowerBound
      else { return nil }

      let match = input[..<endIndex]

      input = input[endIndex...]

      return match
    }
  }

  static func prefix(through substring: Substring) -> Self {
    Self { input in
      guard let endIndex = input.range(of: substring)?.upperBound
      else { return nil }

      let match = input[..<endIndex]

      input = input[endIndex...]

      return match
    }
  }
}

extension Parser: ExpressibleByUnicodeScalarLiteral where Input == Substring, Output == Void {
  public typealias UnicodeScalarLiteralType = StringLiteralType
}

extension Parser: ExpressibleByExtendedGraphemeClusterLiteral where Input == Substring, Output == Void {
  public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
}

extension Parser: ExpressibleByStringLiteral where Input == Substring, Output == Void {
  public typealias StringLiteralType = String

  public init(stringLiteral value: String) {
    self = .prefix(value[...])
  }
}

public extension Parser {
  static func skip(_ p: Self) -> Parser<Input, Void> {
    p.map { _ in () }
  }

  func skip<OtherOutput>(_ p: Parser<Input, OtherOutput>) -> Self {
    zip(self, p).map { a, _ in a }
  }

  func take<NewOutput>(_ p: Parser<Input, NewOutput>) -> Parser<Input, (Output, NewOutput)> {
    zip(self, p)
  }

  func take<A>(_ p: Parser<Input, A>) -> Parser<Input, A>
  where Output == Void {
    zip(self, p).map { _, a in a }
  }

  func take<A, B, C>(_ p: Parser<Input, C>) -> Parser<Input, (A, B, C)>
  where Output == (A, B) {
    zip(self, p).map { ab, c in
      (ab.0, ab.1, c)
    }
  }
}
