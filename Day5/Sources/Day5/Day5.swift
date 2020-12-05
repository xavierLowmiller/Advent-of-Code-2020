struct Seat {
    let row: Int
    let column: Int

    var id: Int {
        row * 8 + column
    }

    init(string: String) throws {
        row = try string.prefix(7).binarySearchIndex(low: "F", high: "B")
        column = try string.suffix(3).binarySearchIndex(low: "L", high: "R")
    }
}

struct SeatError: Error {}

extension Substring {
    func binarySearchIndex(low: Character, high: Character) throws -> Int {
        var int = 0
        var copy = self
        while !copy.isEmpty {
            int <<= 1
            let c = copy.removeFirst()
            switch c {
            case low:
                break
            case high:
                int += 1
            default:
                throw SeatError()
            }
        }
        return int
    }
}
