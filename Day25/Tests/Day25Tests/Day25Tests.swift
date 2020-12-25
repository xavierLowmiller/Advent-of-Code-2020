import XCTest
@testable import Day25

final class Day25Tests: XCTestCase {
    func testDay25Part1LoopSize() {
        let cardLoopSize = findLoopSize(forSubjectNumber: 5764801)
        let doorLoopSize = findLoopSize(forSubjectNumber: 17807724)

        print("cardLoopSize:", cardLoopSize)
        print("doorLoopSize:", doorLoopSize)

        XCTAssertEqual(cardLoopSize, 8)
        XCTAssertEqual(doorLoopSize, 11)

        let cardPublicKey = transform(subjectNumber: 7, loopSize: cardLoopSize)
        let doorPublicKey = transform(subjectNumber: 7, loopSize: doorLoopSize)
        print("Card public key:", cardPublicKey)
        print("Door public key:", doorPublicKey)

        XCTAssertEqual(cardPublicKey, 5764801)
        XCTAssertEqual(doorPublicKey, 17807724)

        print("Encryption key:", transform(subjectNumber: doorPublicKey, loopSize: cardLoopSize))
        print("Encryption key:", transform(subjectNumber: cardPublicKey, loopSize: doorLoopSize))

        XCTAssertEqual(transform(subjectNumber: doorPublicKey, loopSize: cardLoopSize), 14897079)
        XCTAssertEqual(transform(subjectNumber: cardPublicKey, loopSize: doorLoopSize), 14897079)
    }

    func testDay25Part1() {
        let doorLoopSize = findLoopSize(forSubjectNumber: 15530095)

        print("Part 1:", transform(subjectNumber: 17773298, loopSize: doorLoopSize))
    }
}
