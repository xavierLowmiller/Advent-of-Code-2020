enum Seat {
    case empty
    case taken
    case floor

    init?(character: Character) {
        switch character {
        case "L":
            self = .empty
        case "#":
            self = .taken
        case ".":
            self = .floor
        default:
            return nil
        }
    }

    var isSeat: Bool {
        self == .empty || self == .taken
    }
}

final class Board {

    private(set) var state: [[Seat]]

    init(input: String) {
        state = []
        for row in input.split(separator: "\n") {
            state.append(row.compactMap(Seat.init))
        }
    }

    var numberOfOccupiedSeats: Int {
        state.flatMap { $0 }.filter { $0 == .taken }.count
    }
}

// Part 1
extension Board {
    func applySeatingRulesPart1() -> [[Seat]] {
        var newState = state
        for x in state.indices {
            for y in state[x].indices {
                guard state[x][y].isSeat else { continue }
                let occupiedNeighbors = self.neighbors(of: (x, y)).filter { $0 == .taken }.count
                if occupiedNeighbors == 0, state[x][y] == .empty {
                    newState[x][y] = .taken
                }

                if occupiedNeighbors >= 4, state[x][y] == .taken {
                    newState[x][y] = .empty
                }
            }
        }

        return newState
    }

    func processPart1() {
        var oldState: [[Seat]]
        repeat {
            oldState = state
            state = applySeatingRulesPart1()
        } while oldState != state
    }

    private func neighbors(of point: (x: Int, y: Int)) -> [Seat] {
        let (x, y) = point
        return [
            state[safe: x - 1]?[safe: y - 1],
            state[safe: x - 1]?[safe: y    ],
            state[safe: x - 1]?[safe: y + 1],
            state[safe: x    ]?[safe: y - 1],
            state[safe: x    ]?[safe: y + 1],
            state[safe: x + 1]?[safe: y - 1],
            state[safe: x + 1]?[safe: y    ],
            state[safe: x + 1]?[safe: y + 1],
        ].compactMap { $0 }
    }
}

// Part 2
extension Board {
    func applySeatingRulesPart2() -> [[Seat]] {
        var newState = state
        for x in state.indices {
            for y in state[x].indices {
                guard state[x][y].isSeat else { continue }
                let occupiedNeighbors = visibleNeighbors(of: (x, y)).filter { $0 == .taken }.count
                if occupiedNeighbors == 0, state[x][y] == .empty {
                    newState[x][y] = .taken
                }

                if occupiedNeighbors >= 5, state[x][y] == .taken {
                    newState[x][y] = .empty
                }
            }
        }

        return newState
    }

    func processPart2() {
        var oldState: [[Seat]]
        repeat {
            oldState = state
            state = applySeatingRulesPart2()
        } while oldState != state
    }

    func visibleNeighbors(of point: (x: Int, y: Int)) -> [Seat] {
        [
            hasVisibleNeighbor(at: point, in: (-1, -1)) ? .taken : .empty,
            hasVisibleNeighbor(at: point, in: (-1,  0)) ? .taken : .empty,
            hasVisibleNeighbor(at: point, in: (-1, +1)) ? .taken : .empty,
            hasVisibleNeighbor(at: point, in: ( 0, -1)) ? .taken : .empty,
            hasVisibleNeighbor(at: point, in: ( 0, +1)) ? .taken : .empty,
            hasVisibleNeighbor(at: point, in: (+1, -1)) ? .taken : .empty,
            hasVisibleNeighbor(at: point, in: (+1,  0)) ? .taken : .empty,
            hasVisibleNeighbor(at: point, in: (+1, +1)) ? .taken : .empty,
        ]
    }

    private func hasVisibleNeighbor(at point: (x: Int, y: Int), in direction: (x: Int, y: Int)) -> Bool {
        var (x, y) = point
        let (dx, dy) = direction
        var hasVisibleNeighbor = false

        x += dx
        y += dy
        while let seat = state[safe: x]?[safe: y] {
            x += dx
            y += dy
            if seat == .empty {
                break
            }
            if seat == .taken {
                hasVisibleNeighbor = true
                break
            }
        }

        return hasVisibleNeighbor
    }
}

private extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
