import XCTest
@testable import Day9

final class Day9Tests: XCTestCase {
    func testDay9Part1Example() {
        let input = """
        35
        20
        15
        25
        47
        40
        62
        55
        65
        95
        102
        117
        150
        182
        127
        219
        299
        277
        309
        576
        """
            .components(separatedBy: "\n")
            .compactMap(Int.init)

        XCTAssertEqual(input.verifyCipher(preambleSize: 5), 127)
    }

    func testDay9Part1() throws {
        let solution = try XCTUnwrap(input.verifyCipher(preambleSize: 25))
        print("Part 1:", solution)
    }

    func testDay9Part2Example() {
        let input = """
        35
        20
        15
        25
        47
        40
        62
        55
        65
        95
        102
        117
        150
        182
        127
        219
        299
        277
        309
        576
        """
            .components(separatedBy: "\n")
            .compactMap(Int.init)

        XCTAssertEqual(input.findWeakness(preambleSize: 5), 62)
    }

    func testDay9Part2() throws {
        let solution = try XCTUnwrap(input.findWeakness(preambleSize: 25))
        print("Part 2:", solution)
    }
}
