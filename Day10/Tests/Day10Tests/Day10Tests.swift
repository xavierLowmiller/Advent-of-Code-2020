import XCTest
@testable import Day10

final class Day10Tests: XCTestCase {
    func testDay10Part1Example1() {
        let input = """
        16
        10
        15
        5
        1
        11
        7
        19
        6
        12
        4
        """

        let adapters = input.components(separatedBy: "\n").compactMap(Int.init)
        let jolts = adapters.jolts

        XCTAssertEqual(jolts.ones * jolts.threes, 35)
    }

    func testDay10Part1Example2() {
        let input = """
        28
        33
        18
        42
        31
        14
        46
        20
        48
        47
        24
        23
        49
        45
        19
        38
        39
        11
        1
        32
        25
        35
        8
        17
        7
        9
        4
        2
        34
        10
        3
        """

        let adapters = input.components(separatedBy: "\n").compactMap(Int.init)
        let jolts = adapters.jolts

        XCTAssertEqual(jolts.ones * jolts.threes, 220)
    }

    func testDay10Part1() {

        let adapters = input.components(separatedBy: "\n").compactMap(Int.init)
        let jolts = adapters.jolts

        print("Part 1:", jolts.ones * jolts.threes)
    }

    func testDay10Part2Example1() {
        let input = """
        16
        10
        15
        5
        1
        11
        7
        19
        6
        12
        4
        """

        let adapters = input.components(separatedBy: "\n").compactMap(Int.init)
        let possibleArrangements = adapters.possibleArrangements

        XCTAssertEqual(possibleArrangements, 8)
    }

    func testDay10Part2Example2() {
        let input = """
        28
        33
        18
        42
        31
        14
        46
        20
        48
        47
        24
        23
        49
        45
        19
        38
        39
        11
        1
        32
        25
        35
        8
        17
        7
        9
        4
        2
        34
        10
        3
        """

        let adapters = input.components(separatedBy: "\n").compactMap(Int.init)
        let possibleArrangements = adapters.possibleArrangements

        XCTAssertEqual(possibleArrangements, 19208)
    }

    func testDay10Part2() {

        let adapters = input.components(separatedBy: "\n").compactMap(Int.init)
        let possibleArrangements = adapters.possibleArrangements

        print("Part 2:", possibleArrangements)
    }
}
