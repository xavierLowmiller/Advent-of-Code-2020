import XCTest
@testable import Day15

final class Day15Tests: XCTestCase {

    func testDay15Part1Example() {
        let input = "0,3,6".split(separator: ",").compactMap { Int($0) }

        let elvesGame = ElvesGame(numbers: input)

        XCTAssertEqual(elvesGame.state, [0: 1, 3: 2])
        XCTAssertEqual(elvesGame.round, 3)
        XCTAssertEqual(elvesGame.lastNumber, 6)

        XCTAssertEqual(elvesGame.play(rounds: 4), 0)

        XCTAssertEqual(elvesGame.state, [0: 1, 3: 2, 6: 3])
        XCTAssertEqual(elvesGame.round, 4)
        XCTAssertEqual(elvesGame.lastNumber, 0)

        XCTAssertEqual(elvesGame.play(rounds: 5), 3)

        XCTAssertEqual(elvesGame.state, [0: 4, 3: 2, 6: 3])
        XCTAssertEqual(elvesGame.round, 5)
        XCTAssertEqual(elvesGame.lastNumber, 3)

        XCTAssertEqual(elvesGame.play(rounds: 6), 3)
        XCTAssertEqual(elvesGame.play(rounds: 7), 1)
        XCTAssertEqual(elvesGame.play(rounds: 8), 0)
        XCTAssertEqual(elvesGame.play(rounds: 9), 4)
        XCTAssertEqual(elvesGame.play(rounds: 10), 0)

        XCTAssertEqual(elvesGame.play(rounds: 2020), 436)
    }

    func testDay15Part1() {
        let input = "1,0,16,5,17,4".split(separator: ",").compactMap { Int($0) }

        let elvesGame = ElvesGame(numbers: input)

        print("Part 1:", elvesGame.play(rounds: 2020))
    }

    func testDay15Part2() {
        let input = "1,0,16,5,17,4".split(separator: ",").compactMap { Int($0) }

        let elvesGame = ElvesGame(numbers: input)

        print("Part 2:", elvesGame.play(rounds: 30000000))
    }
}
