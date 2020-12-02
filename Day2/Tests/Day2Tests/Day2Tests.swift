import XCTest
@testable import Day2

final class Day2Tests: XCTestCase {
    func testValidPassword1a() {
        let password = "1-3 a: abcde"

        XCTAssert(password.isValidPasswordInPart1)
    }

    func testValidPassword2a() {
        let password = "1-3 b: cdefg"

        XCTAssertFalse(password.isValidPasswordInPart1)
    }

    func testValidPassword3a() {
        let password = "2-9 c: ccccccccc"

        XCTAssert(password.isValidPasswordInPart1)
    }

    func testDay2a() {
        XCTAssertEqual(input.map(\.isValidPasswordInPart1).filter { $0 }.count,
                       538)
    }

    func testValidPassword1b() {
        let password = "1-3 a: abcde"

        XCTAssert(password.isValidPasswordInPart2)
    }

    func testValidPassword2b() {
        let password = "1-3 b: cdefg"

        XCTAssertFalse(password.isValidPasswordInPart2)
    }

    func testValidPassword3b() {
        let password = "2-9 c: ccccccccc"

        XCTAssertFalse(password.isValidPasswordInPart2)
    }

    func testDay2b() {
        XCTAssertEqual(input.map(\.isValidPasswordInPart2).filter { $0 }.count,
                       489)
    }
}
