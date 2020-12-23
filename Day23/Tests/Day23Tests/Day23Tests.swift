import XCTest
import Day23

final class Day23Tests: XCTestCase {
    func testDay23Part1Example() {
        let crabCups = CrabCups(string: "(3) 8  9  1  2  5  4  6  7")
        XCTAssertEqual(crabCups.currentCup, 3)
        XCTAssertEqual(crabCups.state, [
            3: 8,
            8: 9,
            9: 1,
            1: 2,
            2: 5,
            5: 4,
            4: 6,
            6: 7,
            7: 3
        ])

        crabCups.playRound()

        XCTAssertEqual(crabCups.currentCup, 2)
        XCTAssertEqual(crabCups.state, [
            3: 2,
            2: 8,
            8: 9,
            9: 1,
            1: 5,
            5: 4,
            4: 6,
            6: 7,
            7: 3
        ])

        crabCups.playRound()

        XCTAssertEqual(crabCups.currentCup, 5)
        XCTAssertEqual(crabCups.state, [
            3: 2,
            2: 5,
            5: 4,
            4: 6,
            6: 7,
            7: 8,
            8: 9,
            9: 1,
            1: 3
        ])

        crabCups.playRound()
        XCTAssertEqual(crabCups.currentCup, 8)

        crabCups.playRound()
        XCTAssertEqual(crabCups.currentCup, 4)

        crabCups.playRound()
        XCTAssertEqual(crabCups.currentCup, 1)

        crabCups.playRound()
        XCTAssertEqual(crabCups.currentCup, 9)

        crabCups.playRound()
        XCTAssertEqual(crabCups.currentCup, 2)

        crabCups.playRound()
        XCTAssertEqual(crabCups.currentCup, 6)

        crabCups.playRound()
        XCTAssertEqual(crabCups.currentCup, 5)

        crabCups.playRound()
        XCTAssertEqual(crabCups.currentCup, 8)

        XCTAssertEqual(crabCups.answerPart1, "92658374")

        for _ in 10..<100 {
            crabCups.playRound()
        }
        XCTAssertEqual(crabCups.answerPart1, "67384529")
    }

    func testDay23Part1() {
        let crabCups = CrabCups(string: "614752839")
        for _ in 0..<100 {
            crabCups.playRound()
        }
        print("Part 1:", crabCups.answerPart1)
    }

    func testDay23Part2Example() {
        let crabCups = CrabCups(string: "389125467", amountOfCups: 1000000)
        XCTAssertEqual(crabCups.state.count, 1000000)
        for _ in 0..<10000000 {
            crabCups.playRound()
        }
        XCTAssertEqual(crabCups.answerPart2, 149245887792)
    }

    func testDay23Part2() {
        let crabCups = CrabCups(string: "614752839", amountOfCups: 1000000)
        for _ in 0..<10000000 {
            crabCups.playRound()
        }
        print("Part 2:", crabCups.answerPart2)
    }
}
