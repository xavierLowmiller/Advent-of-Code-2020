import XCTest
@testable import Day12

final class Day12Tests: XCTestCase {
    func testDay12Part1Example() {
        let input = """
        F10
        N3
        F7
        R90
        F11
        """

        let ship = Ship()
        input
            .components(separatedBy: "\n")
            .map(Instruction.init)
            .forEach(ship.handleInstructionDirectly)

        XCTAssertEqual(ship.manhattanDistance, 25)
    }

    func testDay12Part1() {
        let ship = Ship()
        input
            .components(separatedBy: "\n")
            .map(Instruction.init)
            .forEach(ship.handleInstructionDirectly)

        print("Part 1:", ship.manhattanDistance)
    }

    func testDay12Part2Example() {
        let input = """
        F10
        N3
        F7
        R90
        F11
        """

        let ship = Ship()
        input
            .components(separatedBy: "\n")
            .map(Instruction.init)
            .forEach(ship.handleInstructionWaypoint)

        XCTAssertEqual(ship.manhattanDistance, 286)
    }

    func testDay12Part2() {
        let ship = Ship()
        input
            .components(separatedBy: "\n")
            .map(Instruction.init)
            .forEach(ship.handleInstructionWaypoint)

        print("Part 2:", ship.manhattanDistance)
    }
}
