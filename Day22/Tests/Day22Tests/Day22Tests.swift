import XCTest
@testable import Day22

final class Day22Tests: XCTestCase {
    func testDay22Part1Example() {
        let input = """
        Player 1:
        9
        2
        6
        3
        1

        Player 2:
        5
        8
        4
        7
        10
        """

        let players = input.components(separatedBy: "\n\n").map(Player.init)

        XCTAssertEqual(players[0].id, 1)
        XCTAssertEqual(players[0].cards, [9, 2, 6, 3, 1])
        XCTAssertEqual(players[1].id, 2)
        XCTAssertEqual(players[1].cards, [5, 8, 4, 7, 10])

        let game = CombatGame(player1: players[0], player2: players[1])
        game.playRound()
        XCTAssertEqual(game.player1.cards, [2, 6, 3, 1, 9, 5])
        XCTAssertEqual(game.player2.cards, [8, 4, 7, 10])

        let winner = game.playUntilTheEnd()
        XCTAssertEqual(winner.id, 2)
        XCTAssertEqual(winner.score, 306)
    }

    func testDay22Part1() {

        let players = input.components(separatedBy: "\n\n").map(Player.init)

        let game = CombatGame(player1: players[0], player2: players[1])

        let winner = game.playUntilTheEnd()
        print("Part 1:", winner.score)
    }
    
    func testDay22Part2Example() {
        let input = """
        Player 1:
        9
        2
        6
        3
        1

        Player 2:
        5
        8
        4
        7
        10
        """

        let players = input.components(separatedBy: "\n\n").map(Player.init)

        let game = RecursiveCombatGame(player1: players[0], player2: players[1])

        let winner = game.playUntilTheEnd()
        XCTAssertEqual(winner.id, 2)
        XCTAssertEqual(winner.score, 291)
    }

    func testAvoidInfiniteRecursion1() {
        let input = """
        Player 1:
        43
        19

        Player 2:
        2
        29
        14
        """

        let players = input.components(separatedBy: "\n\n").map(Player.init)

        let game = RecursiveCombatGame(player1: players[0], player2: players[1])

        let winner = game.playUntilTheEnd()
        XCTAssertEqual(winner.id, players[0].id)
    }

    func testAvoidInfiniteRecursion2() {
        let input = """
        Player 2:
        2
        29
        14

        Player 1:
        43
        19
        """

        let players = input.components(separatedBy: "\n\n").map(Player.init)

        let game = RecursiveCombatGame(player1: players[0], player2: players[1])

        let winner = game.playUntilTheEnd()
        XCTAssertEqual(winner.id, players[0].id)
    }

    func testDay22Part2() {

        let players = input.components(separatedBy: "\n\n").map(Player.init)

        let game = RecursiveCombatGame(player1: players[0], player2: players[1])

        let winner = game.playUntilTheEnd()
        print("Part 2:", winner.score)
    }
}
