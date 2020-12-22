import Foundation

struct Player {
    let id: Int
    var cards: [Int]

    init(string: String) {
        id = Int(string.components(separatedBy: ":\n")[0]
            .components(separatedBy: " ")[1])!
        cards = string.components(separatedBy: ":\n")[1]
            .components(separatedBy: "\n")
            .compactMap(Int.init)
    }

    var score: Int {
        zip(cards.reversed(), 1...).map(*).reduce(0, +)
    }
}

final class CombatGame {
    var player1: Player
    var player2: Player

    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }

    func playRound() {
        let player1Card = player1.cards.removeFirst()
        let player2Card = player2.cards.removeFirst()

        if player1Card > player2Card {
            player1.cards.append(player1Card)
            player1.cards.append(player2Card)
        } else {
            player2.cards.append(player2Card)
            player2.cards.append(player1Card)
        }
    }

    func playUntilTheEnd() -> Player {
        while !player1.cards.isEmpty && !player2.cards.isEmpty {
            playRound()
        }

        if player1.cards.isEmpty {
            return player2
        } else {
            return player1
        }
    }
}

final class RecursiveCombatGame {
    var player1: Player
    var player2: Player

    private var previousMatchups: Set<[Int]> = []

    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }

    func playRound() {
        let player1Card = player1.cards.removeFirst()
        let player2Card = player2.cards.removeFirst()

        if player1Card <= player1.cards.count, player2Card <= player2.cards.count {
            var subgamePlayer1 = player1
            var subgamePlayer2 = player2

            subgamePlayer1.cards = Array(subgamePlayer1.cards.prefix(player1Card))
            subgamePlayer2.cards = Array(subgamePlayer2.cards.prefix(player2Card))

            let sideGame = RecursiveCombatGame(player1: subgamePlayer1, player2: subgamePlayer2)
            let winner = sideGame.playUntilTheEnd()
            if winner.id == player1.id {
                player1.cards.append(player1Card)
                player1.cards.append(player2Card)
            } else {
                player2.cards.append(player2Card)
                player2.cards.append(player1Card)
            }
            return
        }

        if player1Card > player2Card {
            player1.cards.append(player1Card)
            player1.cards.append(player2Card)
        } else {
            player2.cards.append(player2Card)
            player2.cards.append(player1Card)
        }
    }

    func playUntilTheEnd() -> Player {
        while !player1.cards.isEmpty && !player2.cards.isEmpty {
            guard !previousMatchups.contains(player1.cards),
                  !previousMatchups.contains(player2.cards)
            else { return player1 }

            previousMatchups.insert(player1.cards)
            previousMatchups.insert(player2.cards)

            playRound()
        }

        if player1.cards.isEmpty {
            return player2
        } else {
            return player1
        }
    }
}
