import XCTest
@testable import Day17

final class Day17Tests: XCTestCase {
    func testDay17Part1Example() {
        let input = """
        .#.
        ..#
        ###
        """

        let board = Board3D(string: input)
        XCTAssertEqual(board.activeCubes, [
            .init(x: 1, y: 0, z: 0),
            .init(x: 2, y: 1, z: 0),
            .init(x: 0, y: 2, z: 0),
            .init(x: 1, y: 2, z: 0),
            .init(x: 2, y: 2, z: 0)
        ])

        board.increment()

        XCTAssertEqual(board.activeCubes.count, 11)

        for _ in 0..<5 {
            board.increment()
        }

        XCTAssertEqual(board.activeCubes.count, 112)
    }

    func testDay17Part2() {
        let board = Board3D(string: input)

        for _ in 0..<6 {
            board.increment()
        }

        print("Part 1:", board.activeCubes.count)
    }
    func testDay17Part2Example() {
        let input = """
        .#.
        ..#
        ###
        """

        let board = Board4D(string: input)
        XCTAssertEqual(board.activeCubes, [
            .init(w: 0, x: 1, y: 0, z: 0),
            .init(w: 0, x: 2, y: 1, z: 0),
            .init(w: 0, x: 0, y: 2, z: 0),
            .init(w: 0, x: 1, y: 2, z: 0),
            .init(w: 0, x: 2, y: 2, z: 0)
        ])

        for _ in 0..<6 {
            board.increment()
        }

        XCTAssertEqual(board.activeCubes.count, 848)
    }

    func testDay17Part1() {
        let board = Board4D(string: input)

        for _ in 0..<6 {
            board.increment()
        }

        print("Part 2:", board.activeCubes.count)
    }
}
