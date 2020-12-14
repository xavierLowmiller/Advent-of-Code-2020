import XCTest
@testable import Day14

final class Day14Tests: XCTestCase {
    func testDay14Part1Example() {
        let input = """
        mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
        mem[8] = 11
        mem[7] = 101
        mem[8] = 0
        """

        let program = Program()
        program.runV1(input)
        XCTAssertEqual(program.checkSum, 165)
    }

    func testDay14Part1() {
        let program = Program()
        program.runV1(input)
        print("Part 1:", program.checkSum)
    }

    func testDay14Part2Example() {
        let input = """
        mask = 000000000000000000000000000000X1001X
        mem[42] = 100
        mask = 00000000000000000000000000000000X0XX
        mem[26] = 1
        """

        let program = Program()
        program.runV2(input)
        XCTAssertEqual(program.checkSum, 208)
    }

    func testDay14Part2() {
        let program = Program()
        program.runV2(input)
        print("Part 2:", program.checkSum)
    }
}
