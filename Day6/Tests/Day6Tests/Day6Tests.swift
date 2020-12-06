import XCTest
@testable import Day6

final class Day6Tests: XCTestCase {
    func testGroupInit() {
        let input = """
        abcx
        abcy
        abcz
        """

        let group = TravelGroup(string: input)

        XCTAssertEqual(group.questions.count, 6)
    }

    func testDay6Part1Example() {
        let input = """
        abc

        a
        b
        c

        ab
        ac

        a
        a
        a
        a

        b
        """

        let customsForm = CustomsForm(string: input)

        XCTAssertEqual(customsForm.questionsCount, 11)
    }

    func testDay6Part1() {
        let customsForm = CustomsForm(string: input)

        print(customsForm.questionsCount)
    }

    func testDay6Part2Example() {
        let input = """
        abc

        a
        b
        c

        ab
        ac

        a
        a
        a
        a

        b
        """

        let customsForm = CustomsForm(string: input)

        XCTAssertEqual(customsForm.amountOfQuestionsEveryoneAnsweredWithYes, 6)
    }

    func testDay6Part2() {
        let customsForm = CustomsForm(string: input)

        print(customsForm.amountOfQuestionsEveryoneAnsweredWithYes)
    }
}
