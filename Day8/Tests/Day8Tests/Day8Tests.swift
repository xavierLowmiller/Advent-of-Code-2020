import XCTest
@testable import Day8

final class Day8Tests: XCTestCase {
    func testDay8Part1Example() {
        let input = """
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6
        """

        let program = Program(string: input)
        let (isLoop, acc) = program.checkForInifiniteLoop()
        XCTAssert(isLoop)
        XCTAssertEqual(acc, 5)
    }

    func testDay8Part1() {
        let program = Program(string: input)
        let (isLoop, acc) = program.checkForInifiniteLoop()
        XCTAssert(isLoop)
        print(acc)
    }

    func testDay8Part2Example() {
        let input = """
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6
        """

        let program = Program(string: input)
        let acc = program.fuzzProgram()
        XCTAssertEqual(acc, 8)
    }

    func testDay8Part2() {
        let program = Program(string: input)
        let acc = program.fuzzProgram()
        print(acc!)
    }
}
