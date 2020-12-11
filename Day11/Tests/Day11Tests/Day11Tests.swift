import XCTest
@testable import Day11

final class Day11Tests: XCTestCase {
    func testDay11Part1Example() {
        let input = """
        L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL
        """

        let board = Board(input: input)

        board.processPart1()

        XCTAssertEqual(board.numberOfOccupiedSeats, 37)
    }

    func testDay11Part1() {
        let board = Board(input: input)

        board.processPart1()

        print("Part 1:", board.numberOfOccupiedSeats)
    }

    func testDay11Part2Example() {
        let input = """
        L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL
        """

        let board = Board(input: input)

        board.processPart2()

        XCTAssertEqual(board.numberOfOccupiedSeats, 26)
    }

    func testDay11Part2SeeEightOccupiedSeats() {
        let input = """
        .......#.
        ...#.....
        .#.......
        .........
        ..#L....#
        ....#....
        .........
        #........
        ...#.....
        """

        let board = Board(input: input)

        XCTAssertEqual(board.visibleNeighbors(of: (4, 3)), Array(repeating: .taken, count: 8))
    }

    func testDay11Part2SeeEightEmptySeats() {
        let input = """
        .##.##.
        #.#.#.#
        ##...##
        ...L...
        ##...##
        #.#.#.#
        .##.##.
        """

        let board = Board(input: input)

        XCTAssertEqual(board.visibleNeighbors(of: (3, 3)), Array(repeating: .empty, count: 8))
    }

    func testDay11Part2SeeMixedSeats() {
        let input = """
        .............
        .L.L.#.#.#.#.
        .............
        """

        let board = Board(input: input)

        XCTAssertEqual(board.visibleNeighbors(of: (1, 3)).filter { $0 == .taken }.count, 1)

        XCTAssertEqual(board.visibleNeighbors(of: (1, 1)).filter { $0 == .taken }.count, 0)
    }

    func testDay11Part2() {
        let board = Board(input: input)

        board.processPart2()

        print("Part 2:", board.numberOfOccupiedSeats)
    }

}
