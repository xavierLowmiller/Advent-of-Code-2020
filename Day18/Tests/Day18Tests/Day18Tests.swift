import XCTest
@testable import Day18

final class Day18Tests: XCTestCase {
    func testSimplifyExpression1() {
        let result = simplifyExpressionPart1("23")
        XCTAssertEqual(result, 23)
    }

    func testSimplifyExpression2() {
        let result = simplifyExpressionPart1("1 + 2")
        XCTAssertEqual(result, 3)
    }

    func testSimplifyExpression3() {
        let result = simplifyExpressionPart1("1 * 2")
        XCTAssertEqual(result, 2)
    }

    func testSimplifyExpression4() {
        let result = simplifyExpressionPart1("1 + 2 * 3")
        XCTAssertEqual(result, 9)
    }

    func testSimplifyExpression5() {
        let result = simplifyExpressionPart1("1 + 2 * 3 + 4")
        XCTAssertEqual(result, 13)
    }

    func testSimplifyExpression6() {
        let result = simplifyExpressionPart1("1 + (2 * 3)")
        XCTAssertEqual(result, 7)
    }

    func testDay18Part1Example1() {
        let input = "1 + 2 * 3 + 4 * 5 + 6"
        let result = simplifyExpressionPart1(input)
        XCTAssertEqual(result, 71)
    }

    func testDay18Part1Example2() {
        let input = "1 + (2 * 3) + (4 * (5 + 6))"
        let result = simplifyExpressionPart1(input)
        XCTAssertEqual(result, 51)
    }

    func testDay18Part1Example3() {
        let input = "2 * 3 + (4 * 5)"
        let result = simplifyExpressionPart1(input)
        XCTAssertEqual(result, 26)
    }

    func testDay18Part1Example4() {
        let input = "5 + (8 * 3 + 9 + 3 * 4 * 3)"
        let result = simplifyExpressionPart1(input)
        XCTAssertEqual(result, 437)
    }

    func testDay18Part1Example5() {
        let input = "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))"
        let result = simplifyExpressionPart1(input)
        XCTAssertEqual(result, 12240)
    }

    func testDay18Part1Example6() {
        let input = "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2"
        let result = simplifyExpressionPart1(input)
        XCTAssertEqual(result, 13632)
    }

    func testDay18Part1() {
        let calculations = input.components(separatedBy: "\n").map(simplifyExpressionPart1)
        print("Part 1:", calculations.reduce(0, +))
    }

    func testDay18Part2Example1() {
        let input = "1 + 2 * 3 + 4 * 5 + 6"
        let result = simplifyExpressionPart2(input)
        XCTAssertEqual(result, 231)
    }

    func testDay18Part2Example2() {
        let input = "1 + (2 * 3) + (4 * (5 + 6))"
        let result = simplifyExpressionPart2(input)
        XCTAssertEqual(result, 51)
    }

    func testDay18Part2Example3() {
        let input = "2 * 3 + (4 * 5)"
        let result = simplifyExpressionPart2(input)
        XCTAssertEqual(result, 46)
    }

    func testDay18Part2Example4() {
        let input = "5 + (8 * 3 + 9 + 3 * 4 * 3)"
        let result = simplifyExpressionPart2(input)
        XCTAssertEqual(result, 1445)
    }

    func testDay18Part2Example5() {
        let input = "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))"
        let result = simplifyExpressionPart2(input)
        XCTAssertEqual(result, 669060)
    }

    func testDay18Part2Example6() {
        let input = "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2"
        let result = simplifyExpressionPart2(input)
        XCTAssertEqual(result, 23340)
    }

    func testDay18Part2() {
        let calculations = input.components(separatedBy: "\n").map(simplifyExpressionPart2)
        print("Part 2:", calculations.reduce(0, +))
    }
}
