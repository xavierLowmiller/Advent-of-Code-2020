import XCTest
@testable import Day21

final class Day21Tests: XCTestCase {
    func testDay21Part1Example() {
        let input = """
        mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
        trh fvjkl sbzzf mxmxvkd (contains dairy)
        sqjhc fvjkl (contains soy)
        sqjhc mxmxvkd sbzzf (contains fish)
        """

        let expected: Set<String> = ["kfcds", "nhms", "sbzzf", "trh"]

        XCTAssertEqual(Set(ingredientsWithoutAllergens(input)), expected)
        XCTAssertEqual(ingredientsWithoutAllergens(input).count, 5)
    }

    func testDay21Part1() {
        print("Part 1:", ingredientsWithoutAllergens(input).count)
    }

    func testDay21Part2Example() {
        let input = """
        mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
        trh fvjkl sbzzf mxmxvkd (contains dairy)
        sqjhc fvjkl (contains soy)
        sqjhc mxmxvkd sbzzf (contains fish)
        """

        let expected = "mxmxvkd,sqjhc,fvjkl"

        XCTAssertEqual(dangerousIngredients(input), expected)
    }

    func testDay21Part2() {
        print("Part 2:", dangerousIngredients(input))
    }
}
