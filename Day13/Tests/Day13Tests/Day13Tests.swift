import XCTest
@testable import Day13

final class Day13Tests: XCTestCase {
    func testDay13Part1Example() {
        let input = """
        939
        7,13,x,x,59,x,31,19
        """

        let (id, waitTime) = findNextBus(input)
        XCTAssertEqual(id * waitTime, 295)
    }

    func testDay13Part1() {

        let (id, waitTime) = findNextBus(input)
        print("Part 1",id * waitTime)
    }

    func testDay13Part2Example1() {
        let input = """
        7,13,x,x,59,x,31,19
        """

        let pairs: [(Int, Int)] = input.split(separator: ",")
            .enumerated()
            .compactMap { (index: Int, value: Substring) in
                if let int = Int(value) {
                    return (-index, int)
                } else {
                    return nil
                }
            }
        let a = pairs.map { $0.0 }
        let n = pairs.map { $0.1 }

        XCTAssertEqual(chineseRemainderTheorem(a, n), 1068781)
    }

    func testDay13Part2Example2() {
        let input = """
        17,x,13,19
        """

        let pairs: [(Int, Int)] = input.split(separator: ",")
            .enumerated()
            .compactMap { (index: Int, value: Substring) in
                if let int = Int(value) {
                    return (-index + int, int)
                } else {
                    return nil
                }
            }
        let a = pairs.map { $0.0 }
        let n = pairs.map { $0.1 }

        XCTAssertEqual(chineseRemainderTheorem(a, n), 3417)
    }

    func testDay13Part2Example3() {
        let input = """
        67,7,59,61
        """

        let pairs: [(Int, Int)] = input.split(separator: ",")
            .enumerated()
            .compactMap { (index: Int, value: Substring) in
                if let int = Int(value) {
                    return (-index, int)
                } else {
                    return nil
                }
            }
        let a = pairs.map { $0.0 }
        let n = pairs.map { $0.1 }

        XCTAssertEqual(chineseRemainderTheorem(a, n), 754018)
    }

    func testDay13Part2Example4() {
        let input = """
        67,x,7,59,61
        """

        let pairs: [(Int, Int)] = input.split(separator: ",")
            .enumerated()
            .compactMap { (index: Int, value: Substring) in
                if let int = Int(value) {
                    return (-index, int)
                } else {
                    return nil
                }
            }
        let a = pairs.map { $0.0 }
        let n = pairs.map { $0.1 }

        XCTAssertEqual(chineseRemainderTheorem(a, n), 779210)
    }

    func testDay13Part2Example5() {
        let input = """
        67,7,x,59,61
        """

        let pairs: [(Int, Int)] = input.split(separator: ",")
            .enumerated()
            .compactMap { (index: Int, value: Substring) in
                if let int = Int(value) {
                    return (-index, int)
                } else {
                    return nil
                }
            }
        let a = pairs.map { $0.0 }
        let n = pairs.map { $0.1 }

        XCTAssertEqual(chineseRemainderTheorem(a, n), 1261476)
    }

    func testDay13Part2Example6() {
        let input = """
        1789,37,47,1889
        """

        let pairs: [(Int, Int)] = input.split(separator: ",")
            .enumerated()
            .compactMap { (index: Int, value: Substring) in
                if let int = Int(value) {
                    return (-index, int)
                } else {
                    return nil
                }
            }
        let a = pairs.map { $0.0 }
        let n = pairs.map { $0.1 }

        XCTAssertEqual(chineseRemainderTheorem(a, n), 1202161486)
    }

    func testDay13Part2() {
        let pairs: [(Int, Int)] = input.split(separator: "\n")[1].split(separator: ",")
            .enumerated()
            .compactMap { (index: Int, value: Substring) in
                if let int = Int(value) {
                    var index = -index
                    while index < 0 { index += int }
                    return (index, int)
                } else {
                    return nil
                }
            }
        let a = pairs.map { $0.0 }
        let n = pairs.map { $0.1 }

        print("Part 2:", chineseRemainderTheorem(a, n))
    }
}
