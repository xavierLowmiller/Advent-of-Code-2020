import XCTest
@testable import Day5

final class Day5Tests: XCTestCase {

    func testDay5Example1() throws {
        let seat1 = try Seat(string: "BFFFBBFRRR")
        XCTAssertEqual(seat1.row, 70)
        XCTAssertEqual(seat1.column, 7)
        XCTAssertEqual(seat1.id, 567)

        let seat2 = try Seat(string: "FFFBBBFRRR")
        XCTAssertEqual(seat2.row, 14)
        XCTAssertEqual(seat2.column, 7)
        XCTAssertEqual(seat2.id, 119)

        let seat3 = try Seat(string: "BBFFBBFRLL")
        XCTAssertEqual(seat3.row, 102)
        XCTAssertEqual(seat3.column, 4)
        XCTAssertEqual(seat3.id, 820)
    }

    func testDay5Part1() throws {
        let boardingPasses = try input.map(Seat.init)

        guard let maxID = boardingPasses.map(\.id).max() else { return XCTFail() }

        print(maxID)
    }

    func testDay5Part2() throws {
        let boardingPasses = try input.map(Seat.init)

        let allIDs = boardingPasses.sorted(by: { $0.id < $1.id }).map(\.id)

        for (id1, id2) in zip(allIDs, allIDs.dropFirst()) {
            if id2 != id1 + 1 {
                print("Your id is \(id1 + 1)")
            }
        }
    }
}
