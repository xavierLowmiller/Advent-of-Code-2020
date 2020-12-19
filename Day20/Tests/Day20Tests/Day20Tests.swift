import XCTest
@testable import Day20

final class Day20Tests: XCTestCase {
    func testSingleTileParsing() {
        let input = """
        Tile 2311:
        ..##.#..#.
        ##..#.....
        #...##..#.
        ####.#...#
        ##.##.###.
        ##...#.###
        .#.#.#..##
        ..#....#..
        ###...#.#.
        ..###..###
        """

        let tile = Tile(string: input)

        XCTAssertEqual(tile.id, 2311)
        XCTAssertEqual(tile.leftEdge, Int("0111110010", radix: 2))
        XCTAssertEqual(tile.leftEdgeInverted, Int(String("0111110010".reversed()), radix: 2))
        XCTAssertEqual(tile.topEdge, Int("0011010010", radix: 2))
        XCTAssertEqual(tile.topEdgeInverted, Int(String("0011010010".reversed()), radix: 2))
        XCTAssertEqual(tile.rightEdge, Int("0001011001", radix: 2))
        XCTAssertEqual(tile.rightEdgeInverted, Int(String("0001011001".reversed()), radix: 2))
        XCTAssertEqual(tile.bottomEdge, Int("0011100111", radix: 2))
        XCTAssertEqual(tile.bottomEdgeInverted, Int(String("0011100111".reversed()), radix: 2))

        // Test left rotation
        let left = tile.rotatedLeft

        XCTAssertEqual(left.id, 2311)
        XCTAssertEqual(left.leftEdge, Int(String("0011010010".reversed()), radix: 2))
        XCTAssertEqual(left.leftEdgeInverted, Int("0011010010", radix: 2))
        XCTAssertEqual(left.topEdge, Int("0001011001", radix: 2))
        XCTAssertEqual(left.topEdgeInverted, Int(String("0001011001".reversed()), radix: 2))
        XCTAssertEqual(left.rightEdge, Int(String("0011100111".reversed()), radix: 2))
        XCTAssertEqual(left.rightEdgeInverted, Int("0011100111", radix: 2))
        XCTAssertEqual(left.bottomEdge, Int("0111110010", radix: 2))
        XCTAssertEqual(left.bottomEdgeInverted, Int(String("0111110010".reversed()), radix: 2))

        XCTAssertEqual(tile.rotatedLeft.rotatedLeft.rotatedLeft.rotatedLeft, tile)

        // horizontal flip
        let flippedHorizontally = tile.invertedHorizontally

        XCTAssertEqual(flippedHorizontally.id, 2311)
        XCTAssertEqual(flippedHorizontally.leftEdge, Int("0001011001", radix: 2))
        XCTAssertEqual(flippedHorizontally.leftEdgeInverted, Int(String("0001011001".reversed()), radix: 2))
        XCTAssertEqual(flippedHorizontally.topEdge, Int(String("0011010010".reversed()), radix: 2))
        XCTAssertEqual(flippedHorizontally.topEdgeInverted, Int("0011010010", radix: 2))
        XCTAssertEqual(flippedHorizontally.rightEdge, Int("0111110010", radix: 2))
        XCTAssertEqual(flippedHorizontally.rightEdgeInverted, Int(String("0111110010".reversed()), radix: 2))
        XCTAssertEqual(flippedHorizontally.bottomEdge, Int(String("0011100111".reversed()), radix: 2))
        XCTAssertEqual(flippedHorizontally.bottomEdgeInverted, Int("0011100111", radix: 2))

        XCTAssertEqual(tile.invertedHorizontally.invertedHorizontally, tile)

        // vertical flip
        let flippedVertically = tile.invertedVertically

        XCTAssertEqual(flippedVertically.id, 2311)
        XCTAssertEqual(flippedVertically.leftEdge, Int(String("0111110010".reversed()), radix: 2))
        XCTAssertEqual(flippedVertically.leftEdgeInverted, Int("0111110010", radix: 2))
        XCTAssertEqual(flippedVertically.topEdge, Int("0011100111", radix: 2))
        XCTAssertEqual(flippedVertically.topEdgeInverted, Int(String("0011100111".reversed()), radix: 2))
        XCTAssertEqual(flippedVertically.rightEdge, Int(String("0001011001".reversed()), radix: 2))
        XCTAssertEqual(flippedVertically.rightEdgeInverted, Int("0001011001", radix: 2))
        XCTAssertEqual(flippedVertically.bottomEdge, Int("0011010010", radix: 2))
        XCTAssertEqual(flippedVertically.bottomEdgeInverted, Int(String("0011010010".reversed()), radix: 2))

        XCTAssertEqual(tile.invertedVertically.invertedVertically, tile)
    }

    func testArrayRotation() {
        let array = [
            "abc",
            "bcd",
            "cde"
        ]
        let expected = [
            "cde",
            "bcd",
            "abc"
        ]

        XCTAssertEqual(array.rotatedLeft, expected)
    }

    func testArrayFlipping() {
        let array = [
            "abc",
            "bcd",
            "cde"
        ]
        let expectedVertically = [
            "cde",
            "bcd",
            "abc"
        ]
        let expectedHorizontally = [
            "cba",
            "dcb",
            "edc"
        ]

        XCTAssertEqual(array.invertedVertically, expectedVertically)
        XCTAssertEqual(array.invertedHorizontally, expectedHorizontally)
    }

    func testAmountOfSnakes() {
        let image = """
        .####...#####..#...###..
        #####..#..#.#.####..#.#.
        .#.#...#.###...#.##.##..
        #.#.##.###.#.##.##.#####
        ..##.###.####..#.####.##
        ...#.#..##.##...#..#..##
        #.##.#..#.#..#..##.#.#..
        .###.##.....#...###.#...
        #.####.#.#....##.#..#.#.
        ##...#..#....#..#...####
        ..#.##...###..#.#####..#
        ....#.##.#.#####....#...
        ..##.##.###.....#.##..#.
        #...#...###..####....##.
        .#.##...#.##.#.#.###...#
        #.###.#..####...##..#...
        #.###...#.##...#.######.
        .###.###.#######..#####.
        ..##.#..#..#.#######.###
        #.#..##.########..#..##.
        #.#####..#.#...##..#....
        #....##..#.#########..##
        #...#.....#..##...###.##
        #..###....##.#...##.##.#
        """.components(separatedBy: "\n")

        XCTAssertEqual(image.amountOfSnakes, 2)
    }

    func testExamplePuzzle() {
        let tiles = exampleInput.components(separatedBy: "\n\n").map(Tile.init)
        var puzzle = Puzzle(tiles: tiles)

        puzzle.solve()

        let image = puzzle.composedImage
        XCTAssertEqual(image.numberOfSnakes, 2)

        XCTAssertEqual(puzzle.board.count, tiles.count)
        XCTAssertEqual(puzzle.corners.reduce(1, *), 20899048083289)
    }

    func testPart1() {
        let tiles = input.components(separatedBy: "\n\n").map(Tile.init)

        var puzzle = Puzzle(tiles: tiles)

        puzzle.solve()

        XCTAssertEqual(puzzle.board.count, tiles.count)
        print("Part 1:", puzzle.corners.reduce(1, *))

        let numberOfSnakes = puzzle.composedImage.numberOfSnakes
        let numberOfOctothorpesPerSnakes = """
                          #
        #    ##    ##    ###
         #  #  #  #  #  #
        """.filter({ $0 == "#" }).count
        let numberOfOctothorpesInImage = puzzle.composedImage.joined()
            .filter { $0 == "#" }.count
        print("Part 2:", numberOfOctothorpesInImage - numberOfSnakes * numberOfOctothorpesPerSnakes)
    }
}

let exampleInput = """
    Tile 2311:
    ..##.#..#.
    ##..#.....
    #...##..#.
    ####.#...#
    ##.##.###.
    ##...#.###
    .#.#.#..##
    ..#....#..
    ###...#.#.
    ..###..###

    Tile 1951:
    #.##...##.
    #.####...#
    .....#..##
    #...######
    .##.#....#
    .###.#####
    ###.##.##.
    .###....#.
    ..#.#..#.#
    #...##.#..

    Tile 1171:
    ####...##.
    #..##.#..#
    ##.#..#.#.
    .###.####.
    ..###.####
    .##....##.
    .#...####.
    #.##.####.
    ####..#...
    .....##...

    Tile 1427:
    ###.##.#..
    .#..#.##..
    .#.##.#..#
    #.#.#.##.#
    ....#...##
    ...##..##.
    ...#.#####
    .#.####.#.
    ..#..###.#
    ..##.#..#.

    Tile 1489:
    ##.#.#....
    ..##...#..
    .##..##...
    ..#...#...
    #####...#.
    #..#.#.#.#
    ...#.#.#..
    ##.#...##.
    ..##.##.##
    ###.##.#..

    Tile 2473:
    #....####.
    #..#.##...
    #.##..#...
    ######.#.#
    .#...#.#.#
    .#########
    .###.#..#.
    ########.#
    ##...##.#.
    ..###.#.#.

    Tile 2971:
    ..#.#....#
    #...###...
    #.#.###...
    ##.##..#..
    .#####..##
    .#..####.#
    #..#.#..#.
    ..####.###
    ..#.#.###.
    ...#.#.#.#

    Tile 2729:
    ...#.#.#.#
    ####.#....
    ..#.#.....
    ....#..#.#
    .##..##.#.
    .#.####...
    ####.#.#..
    ##.####...
    ##..#.##..
    #.##...##.

    Tile 3079:
    #.#.#####.
    .#..######
    ..#.......
    ######....
    ####.#..#.
    .#...#.##.
    #.#####.##
    ..#.###...
    ..#.......
    ..#.###...
    """
