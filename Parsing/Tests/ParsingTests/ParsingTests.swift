import XCTest
import Parsing

final class ParsingTests: XCTestCase {
    func testIntParser() {
        let (result, rest) = Parser.int.run("123 Hello")

        XCTAssertEqual(result, 123)
        XCTAssertEqual(rest, " Hello")
    }

    func testDoubleParser() {
        let (result, rest) = Parser.double.run("123.4 Hello")

        XCTAssertEqual(result, 123.4)
        XCTAssertEqual(rest, " Hello")
    }
}
