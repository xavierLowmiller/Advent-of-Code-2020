import XCTest
@testable import Day3

final class Day3Tests: XCTestCase {
  func testDay3Part1Example() {
    let input = """
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
      """
    let slope = Slope(string: input)

    XCTAssertEqual(slope.treesWhileSliding(x: 3, y: 1), 7)
  }

  func testDay3Part1() {

    let slope = Slope(string: input)

    print(slope.treesWhileSliding(x: 3, y: 1))
  }

  func testDay3Part2Example() {
    let input = """
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
      """
    let slope = Slope(string: input)

    XCTAssertEqual(
      slope.treesWhileSliding(x: 1, y: 1) *
      slope.treesWhileSliding(x: 3, y: 1) *
      slope.treesWhileSliding(x: 5, y: 1) *
      slope.treesWhileSliding(x: 7, y: 1) *
      slope.treesWhileSliding(x: 1, y: 2),
      336)
  }

  func testDay3Part2() {

    let slope = Slope(string: input)

    print(
      slope.treesWhileSliding(x: 1, y: 1) *
      slope.treesWhileSliding(x: 3, y: 1) *
      slope.treesWhileSliding(x: 5, y: 1) *
      slope.treesWhileSliding(x: 7, y: 1) *
      slope.treesWhileSliding(x: 1, y: 2)
    )
  }
}
