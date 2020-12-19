import XCTest
@testable import Day19

final class Day19Tests: XCTestCase {

    func testDay19Part1Example1() {
        let input = """
        0: 1 2
        1: "a"
        2: 1 3 | 3 1
        3: "b"
        """

        let matcher = RuleMatcher(string: input)
        XCTAssertEqual(matcher.lookup[0], .rules([1, 2]))
        XCTAssertEqual(matcher.lookup[1], .literal("a"))
        XCTAssertEqual(matcher.lookup[2], .or([1, 3], [3, 1]))
        XCTAssertEqual(matcher.lookup[3], .literal("b"))
    }

    func testDay19Part1Example2() {
        let input = """
        0: 4 1 5
        1: 2 3 | 3 2
        2: 4 4 | 5 5
        3: 4 5 | 5 4
        4: "a"
        5: "b"

        ababbb
        bababa
        abbbab
        aaabbb
        aaaabbb
        """

        let rules = input.components(separatedBy: "\n\n")[0]
        let data = input.components(separatedBy: "\n\n")[1].components(separatedBy: "\n")

        let matcher = RuleMatcher(string: rules)
        XCTAssertEqual(matcher.lookup[0], .rules([4, 1, 5]))
        XCTAssertEqual(matcher.lookup[1], .or([2, 3], [3, 2]))
        XCTAssertEqual(matcher.lookup[2], .or([4, 4], [5, 5]))
        XCTAssertEqual(matcher.lookup[3], .or([4, 5], [5, 4]))
        XCTAssertEqual(matcher.lookup[4], .literal("a"))
        XCTAssertEqual(matcher.lookup[5], .literal("b"))

        XCTAssert(matcher.isValidString(data[0]))
        XCTAssertFalse(matcher.isValidString(data[1]))
        XCTAssert(matcher.isValidString(data[2]))
        XCTAssertFalse(matcher.isValidString(data[3]))
        XCTAssertFalse(matcher.isValidString(data[4]))
    }

    func testDay19Part1() {
        let rules = input1.components(separatedBy: "\n\n")[0]
        let data = input1.components(separatedBy: "\n\n")[1].components(separatedBy: "\n")

        let matcher = RuleMatcher(string: rules)
        print("Part 1:", data.filter(matcher.isValidString).count)
    }

    func testDay19Part2Example1() {
        let input = """
        42: 9 14 | 10 1
        9: 14 27 | 1 26
        10: 23 14 | 28 1
        1: "a"
        11: 42 31 | 42 11 31
        5: 1 14 | 15 1
        19: 14 1 | 14 14
        12: 24 14 | 19 1
        16: 15 1 | 14 14
        31: 14 17 | 1 13
        6: 14 14 | 1 14
        2: 1 24 | 14 4
        0: 8 11
        13: 14 3 | 1 12
        15: 1 | 14
        17: 14 2 | 1 7
        23: 25 1 | 22 14
        28: 16 1
        4: 1 1
        20: 14 14 | 1 15
        3: 5 14 | 16 1
        27: 1 6 | 14 18
        14: "b"
        21: 14 1 | 1 14
        25: 1 1 | 1 14
        22: 14 14
        8: 42 | 42 8
        26: 14 22 | 1 20
        18: 15 15
        7: 14 5 | 1 21
        24: 14 1

        abbbbbabbbaaaababbaabbbbabababbbabbbbbbabaaaa
        bbabbbbaabaabba
        babbbbaabbbbbabbbbbbaabaaabaaa
        aaabbbbbbaaaabaababaabababbabaaabbababababaaa
        bbbbbbbaaaabbbbaaabbabaaa
        bbbababbbbaaaaaaaabbababaaababaabab
        ababaaaaaabaaab
        ababaaaaabbbaba
        baabbaaaabbaaaababbaababb
        abbbbabbbbaaaababbbbbbaaaababb
        aaaaabbaabaaaaababaa
        aaaabbaaaabbaaa
        aaaabbaabbaaaaaaabbbabbbaaabbaabaaa
        babaaabbbaaabaababbaabababaaab
        aabbbbbaabbbaaaaaabbbbbababaaaaabbaaabba
        """

        let rules = input.components(separatedBy: "\n\n")[0]
        let data = input.components(separatedBy: "\n\n")[1].components(separatedBy: "\n")

        let matcher = RuleMatcher(string: rules)

        XCTAssertFalse(matcher.isValidString(data[0]))
        XCTAssert(matcher.isValidString(data[1]))
        XCTAssert(matcher.isValidString(data[2]))
        XCTAssert(matcher.isValidString(data[3]))
        XCTAssert(matcher.isValidString(data[4]))
        XCTAssert(matcher.isValidString(data[5]))
        XCTAssert(matcher.isValidString(data[6]))
        XCTAssert(matcher.isValidString(data[7]))
        XCTAssert(matcher.isValidString(data[8]))
        XCTAssert(matcher.isValidString(data[9]))
        XCTAssert(matcher.isValidString(data[10]))
        XCTAssertFalse(matcher.isValidString(data[11]))
        XCTAssert(matcher.isValidString(data[12]))
        XCTAssertFalse(matcher.isValidString(data[13]))
        XCTAssert(matcher.isValidString(data[14]))
    }

    func testDay19Part2() {
        let rules = input2.components(separatedBy: "\n\n")[0]
        let data = input2.components(separatedBy: "\n\n")[1].components(separatedBy: "\n")

        let matcher = RuleMatcher(string: rules)
        print("Part 2:", data.filter(matcher.isValidString).count)
    }
}
