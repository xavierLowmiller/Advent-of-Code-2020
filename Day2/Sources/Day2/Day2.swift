import Foundation
import Parsing

private struct Validation1 {
  let range: ClosedRange<Int>
  let character: Character

  func validate<S: StringProtocol>(_ string: S) -> Bool {
    range ~= Array(string).filter { $0 == character }.count
  }
}

private struct Validation2 {
  let index1: Int
  let index2: Int
  let character: Character

  func validate<S: StringProtocol>(_ string: S) -> Bool {
    (Array(string)[index1] == character) != (Array(string)[index2] == character)
  }
}

extension String {
  var isValidPasswordInPart1: Bool {

    let validator = Parser.int
      .skip("-")
      .take(.int)
      .skip(" ")
      .take(.char)
      .skip(": ")
      .map { lowerBound, upperBound, char in
        Validation1(range: lowerBound...upperBound, character: char)
      }
    guard case let (result?, password) = validator.run(self[...])
      else { return false }

    return result.validate(password)
  }

  var isValidPasswordInPart2: Bool {
    let validator = Parser.int
      .skip("-")
      .take(.int)
      .skip(" ")
      .take(.char)
      .skip(": ")
      .map { index1, index2, char in
        Validation2(index1: index1 - 1, index2: index2 - 1, character: char)
      }
    guard case let (result?, password) = validator.run(self[...])
      else { return false }

    return result.validate(password)
  }
}
