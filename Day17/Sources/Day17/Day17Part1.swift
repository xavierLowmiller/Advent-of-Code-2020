struct Coordinate3D: Hashable {
    let x, y, z: Int

    var allNeighbors: Set<Coordinate3D> {
        var neighbors: Set<Coordinate3D> = []
        for dx in -1...1 {
            for dy in -1...1 {
                for dz in -1...1 {
                    neighbors.insert(Coordinate3D(x: x + dx, y: y + dy, z: z + dz))
                }
            }
        }
        neighbors.remove(Coordinate3D(x: x, y: y, z: z))
        return neighbors
    }
}

final class Board3D {
    var activeCubes: Set<Coordinate3D> = []

    init(string: String) {
        for (y, substring) in string.split(separator: "\n").enumerated() {
            for (x, character) in substring.enumerated() {
                if character == "#" {
                    activeCubes.insert(.init(x: x, y: y, z: 0))
                }
            }
        }
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
        var nextGen: Set<Coordinate3D> = []
        for x in xRange {
            for y in yRange {
                for z in zRange {
                    let coordinate = Coordinate3D(x: x, y: y, z: z)
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
        activeCubes = nextGen
    }
}
