struct Coordinate4D: Hashable {
    let w, x, y, z: Int

    var allNeighbors: Set<Coordinate4D> {
        var neighbors: Set<Coordinate4D> = []
        for dw in -1...1 {
            for dx in -1...1 {
                for dy in -1...1 {
                    for dz in -1...1 {
                        neighbors.insert(Coordinate4D(w: w + dw, x: x + dx, y: y + dy, z: z + dz))
                    }
                }
            }
        }
        neighbors.remove(Coordinate4D(w: w, x: x, y: y, z: z))
        return neighbors
    }
}

final class Board4D {
    var activeCubes: Set<Coordinate4D> = []

    init(string: String) {
        for (y, substring) in string.split(separator: "\n").enumerated() {
            for (x, character) in substring.enumerated() {
                if character == "#" {
                    activeCubes.insert(.init(w: 0, x: x, y: y, z: 0))
                }
            }
        }
    }

    private var wRange: ClosedRange<Int> {
        let maxW = activeCubes.map(\.w).max()!
        let minW = activeCubes.map(\.w).min()!
        return minW - 1 ... maxW + 1
    }

    private var xRange: ClosedRange<Int> {
        let maxX = activeCubes.map(\.x).max()!
        let minX = activeCubes.map(\.x).min()!
        return minX - 1 ... maxX + 1
    }

    private var yRange: ClosedRange<Int> {
        let maxY = activeCubes.map(\.y).max()!
        let minY = activeCubes.map(\.y).min()!
        return minY - 1 ... maxY + 1
    }

    private var zRange: ClosedRange<Int> {
        let maxZ = activeCubes.map(\.z).max()!
        let minZ = activeCubes.map(\.z).min()!
        return minZ - 1 ... maxZ + 1
    }

    func increment() {
        var nextGen: Set<Coordinate4D> = []
        for w in wRange {
            for x in xRange {
                for y in yRange {
                    for z in zRange {
                        let coordinate = Coordinate4D(w: w, x: x, y: y, z: z)
                        let isActive = activeCubes.contains(coordinate)
                        let neighbors = coordinate.allNeighbors
                        let activeNeighbors = neighbors.intersection(activeCubes).count
                        if isActive {
                            if activeNeighbors == 2 || activeNeighbors == 3 {
                                nextGen.insert(coordinate)
                            }
                        } else {
                            if activeNeighbors == 3 {
                                nextGen.insert(coordinate)
                            }
                        }
                    }
                }
            }
        }
        activeCubes = nextGen
    }
}
