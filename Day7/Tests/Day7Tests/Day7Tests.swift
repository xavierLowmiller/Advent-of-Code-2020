import XCTest
@testable import Day7

final class Day7Tests: XCTestCase {
    func testDay7Part1Example() {
        let input = """
        light red bags contain 1 bright white bag, 2 muted yellow bags.
        dark orange bags contain 3 bright white bags, 4 muted yellow bags.
        bright white bags contain 1 shiny gold bag.
        muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
        shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
        dark olive bags contain 3 faded blue bags, 4 dotted black bags.
        vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
        faded blue bags contain no other bags.
        dotted black bags contain no other bags.
        """

        let bags = input.components(separatedBy: "\n").map(Bag.init)
        XCTAssertEqual(bags.count, 9)
        XCTAssertEqual(bags.bagsThatContain(color: "shiny gold").count, 4)
    }

    func testDay7Part1() {
        let bags = input.components(separatedBy: "\n").map(Bag.init)
        print(bags.bagsThatContain(color: "shiny gold").count)
    }

    func testDay7Part2Example1() {
        let input = """
        light red bags contain 1 bright white bag, 2 muted yellow bags.
        dark orange bags contain 3 bright white bags, 4 muted yellow bags.
        bright white bags contain 1 shiny gold bag.
        muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
        shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
        dark olive bags contain 3 faded blue bags, 4 dotted black bags.
        vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
        faded blue bags contain no other bags.
        dotted black bags contain no other bags.
        """

        let bags = input.components(separatedBy: "\n").map(Bag.init)
        XCTAssertEqual(bags.totalBags(inBagOf: "shiny gold").count - 1, 32)
    }

    func testDay7Part2Example2() {
        let input = """
        shiny gold bags contain 2 dark red bags.
        dark red bags contain 2 dark orange bags.
        dark orange bags contain 2 dark yellow bags.
        dark yellow bags contain 2 dark green bags.
        dark green bags contain 2 dark blue bags.
        dark blue bags contain 2 dark violet bags.
        dark violet bags contain no other bags.
        """

        let bags = input.components(separatedBy: "\n").map(Bag.init)
        XCTAssertEqual(bags.totalBags(inBagOf: "shiny gold").count - 1, 126)
    }

    func testDay7Part2() {
        let bags = input.components(separatedBy: "\n").map(Bag.init)
        print(bags.totalBags(inBagOf: "shiny gold").count - 1)
    }
}
