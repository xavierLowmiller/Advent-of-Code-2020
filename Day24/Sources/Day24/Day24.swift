enum Direction {
    case east
    case southEast
    case northEast
    case west
    case southWest
    case northWest

    init?<S: StringProtocol>(string: S) {
        switch string {
        case "e":
            self = .east
        case "se":
            self = .southEast
        case "ne":
            self = .northEast
        case "w":
            self = .west
        case "sw":
            self = .southWest
        case "nw":
            self = .northWest
        default:
            return nil
        }
    }
}

struct Point: Hashable {
    var x = 0
    var y = 0

    var neighbors: [Point] {
        [
            Point(x: x    , y: y - 1),
            Point(x: x    , y: y + 1),
            Point(x: x + 1, y: y    ),
            Point(x: x - 1, y: y    ),
            Point(x: x + 1, y: y - 1),
            Point(x: x - 1, y: y + 1)
        ]
    }
}

enum TileColor {
    case black, white

    mutating func toggle() {
        self = self == .white ? .black : .white
    }
}

struct FlooringPlan {
    let directions: [[Direction]]
    var tiles: [Point: TileColor] = [:]

    var amountOfBlackTiles: Int {
        tiles.values.filter({ $0 == .black }).count
    }

    init(string: String) {
        directions = string.split(separator: "\n").map {
            var directions: [Direction] = []
            var line = $0
            while !line.isEmpty {
                if let direction = Direction(string: line.prefix(1)) {
                    directions.append(direction)
                    line.removeFirst(1)
                } else if let direction = Direction(string: line.prefix(2)) {
                    directions.append(direction)
                    line.removeFirst(2)
                } else {
                    fatalError()
                }
            }
            return directions
        }
        flipTiles()
    }

    private mutating func flipTiles() {
        for tileDirection in directions {
            var tile = Point()
            for direction in tileDirection {
                switch direction {
                case .east:
                    tile.x += 1
                case .southEast:
                    tile.y += 1
                case .northEast:
                    tile.x += 1
                    tile.y -= 1
                case .west:
                    tile.x -= 1
                case .southWest:
                    tile.x -= 1
                    tile.y += 1
                case .northWest:
                    tile.y -= 1
                }
            }

            var isWhite = tiles[tile, default: .white]
            isWhite.toggle()
            tiles[tile] = isWhite
        }
    }

    mutating func incrementDay() {
        let minX = tiles.keys.map(\.x).min()!
        let maxX = tiles.keys.map(\.x).max()!
        let minY = tiles.keys.map(\.y).min()!
        let maxY = tiles.keys.map(\.y).max()!
        var newTiles: [Point: TileColor] = [:]
        for x in (minX - 1)...(maxX + 1) {
            for y in (minY - 1)...(maxY + 1) {
                let point = Point(x: x, y: y)
                var tile = tiles[point, default: .white]
                let neighbors = point.neighbors.map { tiles[$0, default: .white] }
                let numberOfNeighboringTiles = neighbors.filter { $0 == .black }.count
                if tile == .black, numberOfNeighboringTiles == 0 || numberOfNeighboringTiles > 2 {
                    tile = .white
                } else if tile == .white, numberOfNeighboringTiles == 2 {
                    tile = .black
                }
                newTiles[point] = tile
            }
        }

        tiles = newTiles
    }
}
