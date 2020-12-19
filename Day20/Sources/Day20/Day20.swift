import Foundation

enum Direction {
    case left, right, top, bottom
}

struct Tile: CustomStringConvertible, Equatable {
    let id: Int
    let leftEdge: Int
    let leftEdgeInverted: Int
    let topEdge: Int
    let topEdgeInverted: Int
    let rightEdge: Int
    let rightEdgeInverted: Int
    let bottomEdge: Int
    let bottomEdgeInverted: Int
    let contents: [String]
}

extension Tile {
    init(string: String) {
        id = Int(string.components(separatedBy: ":")[0].components(separatedBy: " ")[1])!
        let lines = string.components(separatedBy: ":\n")[1].components(separatedBy: "\n")
        leftEdge = Int(pattern: String(lines.map { $0.first! }))
        leftEdgeInverted = Int(pattern: String(lines.map { $0.first! }.reversed()))
        topEdge = Int(pattern: lines.first!)
        topEdgeInverted = Int(pattern: String(lines.first!.reversed()))
        rightEdge = Int(pattern: String(lines.map { $0.last! }))
        rightEdgeInverted = Int(pattern: String(lines.map { $0.last! }.reversed()))
        bottomEdge = Int(pattern: lines.last!)
        bottomEdgeInverted = Int(pattern: String(lines.last!.reversed()))
        contents = lines
    }

    /// rotates by 90º to the left
    var rotatedLeft: Tile {
        Tile(
            id: id,
            leftEdge: topEdgeInverted,
            leftEdgeInverted: topEdge,
            topEdge: rightEdge,
            topEdgeInverted: rightEdgeInverted,
            rightEdge: bottomEdgeInverted,
            rightEdgeInverted: bottomEdge,
            bottomEdge: leftEdge,
            bottomEdgeInverted: leftEdgeInverted,
            contents: contents.rotatedLeft
        )
    }

    /// flips the tile horizontally
    var invertedHorizontally: Tile {
        Tile(
            id: id,
            leftEdge: rightEdge,
            leftEdgeInverted: rightEdgeInverted,
            topEdge: topEdgeInverted,
            topEdgeInverted: topEdge,
            rightEdge: leftEdge,
            rightEdgeInverted: leftEdgeInverted,
            bottomEdge: bottomEdgeInverted,
            bottomEdgeInverted: bottomEdge,
            contents: contents.invertedHorizontally
        )
    }

    /// flips the tile vertically
    var invertedVertically: Tile {
        Tile(
            id: id,
            leftEdge: leftEdgeInverted,
            leftEdgeInverted: leftEdge,
            topEdge: bottomEdge,
            topEdgeInverted: bottomEdgeInverted,
            rightEdge: rightEdgeInverted,
            rightEdgeInverted: rightEdge,
            bottomEdge: topEdge,
            bottomEdgeInverted: topEdgeInverted,
            contents: contents.invertedVertically
        )
    }

    var allEdges: [Direction: Int] {
        [.left: leftEdge, .right: rightEdge, .top: topEdge, .bottom: bottomEdge]
    }
    var allInvertedEdges: [Direction: Int] {
        [.left: leftEdgeInverted, .right: rightEdgeInverted, .top: topEdgeInverted, .bottom: bottomEdgeInverted]
    }

    var description: String {
        "Tile \(id) \nleft: \(leftEdge)\ntop: \(topEdge)\nright: \(rightEdge)\nbottom: \(bottomEdge)"
    }

    mutating func rotateAndInvert(soItMatches tile: Tile, at direction: Direction, value: Int) {
        switch direction {
        case .left:
            while !(rightEdge == tile.leftEdge || rightEdgeInverted == tile.leftEdge) {
                self = rotatedLeft
            }
            if rightEdgeInverted == tile.leftEdge {
                self = invertedVertically
            }
            assert(rightEdge == tile.leftEdge)
        case .right:
            while !(leftEdge == tile.rightEdge || leftEdgeInverted == tile.rightEdge) {
                self = rotatedLeft
            }
            if leftEdgeInverted == tile.rightEdge {
                self = invertedVertically
            }
            assert(leftEdge == tile.rightEdge)
        case .top:
            while !(bottomEdge == tile.topEdge || bottomEdgeInverted == tile.topEdge) {
                self = rotatedLeft
            }
            if bottomEdgeInverted == tile.topEdge {
                self = invertedHorizontally
            }
            assert(bottomEdge == tile.topEdge)
        case .bottom:
            while !(topEdge == tile.bottomEdge || topEdgeInverted == tile.bottomEdge) {
                self = rotatedLeft
            }
            if topEdgeInverted == tile.bottomEdge {
                self = invertedHorizontally
            }
            assert(topEdge == tile.bottomEdge)
        }
    }
}

struct Point: Hashable {
    let x: Int
    let y: Int
}

struct Puzzle {
    private(set) var board: [Point: Tile] = [:]
    private(set) var tiles: [Tile]

    init(tiles: [Tile]) {
        self.tiles = tiles
    }

    var isConsistent: Bool {
        // Check size
        let totalTiles = tiles.count + board.values.count
        let gridSize = Int(sqrt(Double(totalTiles)))
        let minX = board.keys.map(\.x).min()!
        let maxX = board.keys.map(\.x).max()!
        let minY = board.keys.map(\.y).min()!
        let maxY = board.keys.map(\.y).max()!
        guard maxX - minX + 1 <= gridSize, maxY - minY + 1 <= gridSize else { return false }

        // Check if pieces within all match
        for (point, tile) in board {
            if let leftNeighbor = board[Point(x: point.x - 1, y: point.y)], leftNeighbor.rightEdge != tile.leftEdge {
                return false
            } else if let rightNeighbor = board[Point(x: point.x + 1, y: point.y)], rightNeighbor.leftEdge != tile.rightEdge {
                return false
            } else if let topNeighbor = board[Point(x: point.x, y: point.y - 1)], topNeighbor.bottomEdge != tile.topEdge {
                return false
            } else if let bottomNeighbor = board[Point(x: point.x, y: point.y + 1)], bottomNeighbor.topEdge != tile.bottomEdge {
                return false
            }
        }
        return true
    }

    var corners: [Int] {
        let minX = board.keys.map(\.x).min()!
        let maxX = board.keys.map(\.x).max()!
        let minY = board.keys.map(\.y).min()!
        let maxY = board.keys.map(\.y).max()!

        return [
            board[Point(x: minX, y: minY)],
            board[Point(x: maxX, y: minY)],
            board[Point(x: minX, y: maxY)],
            board[Point(x: maxX, y: maxY)],
        ].compactMap { $0?.id }
    }

    var freeEdges: [(Point, Direction)] {
        var freeEdges: [(Point, Direction)] = []
        for point in board.keys {
            if !board.keys.contains(Point(x: point.x - 1, y: point.y)) {
                freeEdges.append((point, .left))
            }
            if !board.keys.contains(Point(x: point.x + 1, y: point.y)) {
                freeEdges.append((point, .right))
            }
            if !board.keys.contains(Point(x: point.x, y: point.y - 1)) {
                freeEdges.append((point, .top))
            }
            if !board.keys.contains(Point(x: point.x, y: point.y + 1)) {
                freeEdges.append((point, .bottom))
            }
        }
        return freeEdges
    }

    var composedImage: [String] {
        let minX = board.keys.map(\.x).min()!
        let maxX = board.keys.map(\.x).max()!
        let minY = board.keys.map(\.y).min()!
        let maxY = board.keys.map(\.y).max()!

        var image: [String] = []

        for var y in minY...maxY {
            y -= minY
            for var x in minX...maxX {
                x -= minX
                let tile = board[Point(x: x + minX, y: y + minY)]!
                if x == 0 {
                    image.append(contentsOf: tile.contents.dropFirst().dropLast().map { String($0.dropFirst().dropLast()) })
                } else {
                    for i in (y * (tile.contents.count - 2))..<((y * (tile.contents.count - 2)) + tile.contents.count - 2) {
                        image[i] = image[i] + tile.contents[i - (y * (tile.contents.count - 2)) + 1].dropFirst().dropLast()
                    }
                }
            }
        }

        return image
    }

    mutating func solve() {
        guard !tiles.isEmpty else { return }

        if board.isEmpty {
            board[Point(x: 0, y: 0)] = tiles.removeFirst()
        }

        for (point, direction) in freeEdges {
            let currentTile = board[point]!
            let edge: Int
            let newPoint: Point
            switch direction {
            case .left:
                edge = currentTile.leftEdge
                newPoint = Point(x: point.x - 1, y: point.y)
            case .right:
                edge = currentTile.rightEdge
                newPoint = Point(x: point.x + 1, y: point.y)
            case .top:
                edge = currentTile.topEdge
                newPoint = Point(x: point.x, y: point.y - 1)
            case .bottom:
                edge = currentTile.bottomEdge
                newPoint = Point(x: point.x, y: point.y + 1)
            }
            for var tile in tiles.filter({ $0.allEdges.values.contains(edge) || $0.allInvertedEdges.values.contains(edge) }) {
                var puzzle = self
                puzzle.tiles = tiles.filter { $0.id != tile.id }
                tile.rotateAndInvert(soItMatches: currentTile, at: direction, value: edge)
                puzzle.board[newPoint] = tile

                guard puzzle.isConsistent else { continue }

                puzzle.solve()
                if puzzle.tiles.isEmpty, puzzle.isConsistent {
                    self = puzzle
                    return
                }
            }
        }
    }
}

extension Int {
    init(pattern: String) {
        self = Int(String(pattern.map { $0 == "#" ? "1" : "0" }), radix: 2)!
    }
}

extension Array where Element == String {
    var rotatedLeft: [String] {

        var lines: [[Character]] = self.map { [Character]($0) }
        for (y, line) in enumerated() {
            for (x, char) in line.enumerated() {
                lines[count - x - 1][y] = char
            }
        }
        return lines.map { String($0) }
    }
    var invertedHorizontally: [String] {
        map { line in
            String(line.reversed())
        }
    }

    var invertedVertically: [String] {
        Array(reversed())
    }

    var numberOfSnakes: Int {
        var image = self
        // Iterate over all possible orientations
        var maxSnakes = 0

        for _ in 0..<4 {
            image = image.rotatedLeft
            for _ in 0..<2 {
                image = image.invertedVertically
                for _ in 0..<2 {
                    image = image.invertedHorizontally

                    maxSnakes = Swift.max(maxSnakes, image.amountOfSnakes)
                }
            }
        }

        return maxSnakes
    }

    var amountOfSnakes: Int {
        let snakePart1 = "..................#."
        let snakePart2 = "#....##....##....###"
        let snakePart3 = ".#..#..#..#..#..#..."

        var snakesFound = 0
        for (i, string) in enumerated() {
            let regex = try! NSRegularExpression(pattern: snakePart2)
            for match in regex.matches(in: string, range: NSRange(string.startIndex..<string.endIndex,in: string)) {
                if self[i - 1][Range(match.range, in: string)!].range(of: snakePart1, options: .regularExpression) != nil,
                   self[i + 1][Range(match.range, in: string)!].range(of: snakePart3, options: .regularExpression) != nil {
                    snakesFound += 1
                }
            }
        }
        return snakesFound
    }
}
