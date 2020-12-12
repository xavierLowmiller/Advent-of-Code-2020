enum Direction {
    case east, west, north, south
}

enum Instruction {
    case north(Int)
    case south(Int)
    case east(Int)
    case west(Int)
    case left(Int)
    case right(Int)
    case forward(Int)

    init(from string: String) {
        let value = Int(string.dropFirst())!
        switch string.first {
        case "N":
            self = .north(value)
        case "S":
            self = .south(value)
        case "E":
            self = .east(value)
        case "W":
            self = .west(value)
        case "L":
            self = .left(value)
        case "R":
            self = .right(value)
        case "F":
            self = .forward(value)
        default:
            fatalError()
        }
    }
}

final class Ship {
    private var direction: Direction = .east
    private var position: (x: Int, y: Int) = (0, 0)
    private var waypoint: (x: Int, y: Int) = (10, 1)

    var manhattanDistance: Int {
        abs(position.x) + abs(position.y)
    }
}

// MARK: Part 1
extension Ship {
    func handleInstructionDirectly(_ instruction: Instruction) {
        switch instruction {
        case .north(let steps):
            position.y += steps
        case .south(let steps):
            position.y -= steps
        case .east(let steps):
            position.x += steps
        case .west(let steps):
            position.x -= steps
        case .left(let degrees):
            turn(by: -degrees)
        case .right(let degrees):
            turn(by: degrees)
        case .forward(let steps):
            moveForward(steps)
        }
    }

    private func turn(by degrees: Int) {
        var degrees = degrees
        while degrees != 0 {
            if degrees > 0 {
                degrees -= 90
                turnRight()
            } else {
                degrees += 90
                turnLeft()
            }
        }
    }

    private func turnLeft() {
        switch direction {
        case .east:
            direction = .north
        case .west:
            direction = .south
        case .north:
            direction = .west
        case .south:
            direction = .east
        }
    }

    private func turnRight() {
        switch direction {
        case .east:
            direction = .south
        case .west:
            direction = .north
        case .north:
            direction = .east
        case .south:
            direction = .west
        }
    }

    private func moveForward(_ steps: Int) {
        switch direction {
        case .east:
            position.x += steps
        case .west:
            position.x -= steps
        case .north:
            position.y += steps
        case .south:
            position.y -= steps
        }
    }
}

// MARK: Part 2
extension Ship {
    func handleInstructionWaypoint(_ instruction: Instruction) {
        switch instruction {
        case .north(let steps):
            waypoint.y += steps
        case .south(let steps):
            waypoint.y -= steps
        case .east(let steps):
            waypoint.x += steps
        case .west(let steps):
            waypoint.x -= steps
        case .left(let degrees):
            rotateWaypoint(by: -degrees)
        case .right(let degrees):
            rotateWaypoint(by: degrees)
        case .forward(let times):
            moveTowardsWaypoint(times: times)
        }
    }

    private func rotateWaypoint(by degrees: Int) {
        var degrees = degrees
        while degrees != 0 {
            if degrees > 0 {
                degrees -= 90
                rotateWaypointRight()
            } else {
                degrees += 90
                rotateWaypointLeft()
            }
        }
    }

    private func rotateWaypointLeft() {
        (waypoint.x, waypoint.y) = (-waypoint.y, waypoint.x)
    }

    private func rotateWaypointRight() {
        (waypoint.x, waypoint.y) = (waypoint.y, -waypoint.x)
    }

    private func moveTowardsWaypoint(times: Int) {
        position.x += waypoint.x * times
        position.y += waypoint.y * times
    }
}
