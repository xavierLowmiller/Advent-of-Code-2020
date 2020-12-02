import XCTest
@testable import Day1

final class Day1Tests: XCTestCase {
    func testTupleOf2020() throws {
        let input = [
            1721,
            979,
            366,
            299,
            675,
            1456
        ]

        let tuple = try XCTUnwrap(input.tupleOf2020)
        guard case (1721, 299) = tuple else { return XCTFail() }
//        print("The answer is", tuple.0 * tuple.1)
    }

    func testDay1a() throws {
        let tuple = try XCTUnwrap(input.tupleOf2020)
        print("The answer is", tuple.0 * tuple.1)
    }

    func testTripleOf2020() throws {
        let input = [
            1721,
            979,
            366,
            299,
            675,
            1456
        ]

        let triple = try XCTUnwrap(input.tripleOf2020)
        guard case (979, 366, 675) = triple else { return XCTFail() }
//        print("The answer is", triple.0 * triple.1 * triple.2)
    }

    func testDay1b() throws {
        let triple = try XCTUnwrap(input.tripleOf2020)
        print("The answer is", triple.0 * triple.1 * triple.2)
    }
}
