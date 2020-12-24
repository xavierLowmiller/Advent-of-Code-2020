import XCTest
@testable import Day24

final class Day24Tests: XCTestCase {
    func testDay24Part1Example1() {
        // Given
        let input = "esenee"
        let flooringPlan = FlooringPlan(string: input)
        XCTAssertEqual(flooringPlan.directions, [[.east, .southEast, .northEast, .east]])

        // Then
        XCTAssertEqual(flooringPlan.tiles, [Point(x: 3, y: 0): .black])
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 1)
    }

    func testDay24Part1Example2() {
        // Given
        let input = "esew"
        let flooringPlan = FlooringPlan(string: input)
        XCTAssertEqual(flooringPlan.directions, [[.east, .southEast, .west]])

        // Then
        XCTAssertEqual(flooringPlan.tiles, [Point(x: 0, y: 1): .black])
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 1)
    }

    func testDay24Part1Example3() {
        // Given
        let input = "nwwswee"
        let flooringPlan = FlooringPlan(string: input)
        XCTAssertEqual(flooringPlan.directions, [[.northWest, .west, .southWest, .east, .east]])

        // Then
        XCTAssertEqual(flooringPlan.tiles, [Point(x: 0, y: 0): .black])
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 1)
    }

    func testDay24Part1Example() {
        // Given
        let input = """
        sesenwnenenewseeswwswswwnenewsewsw
        neeenesenwnwwswnenewnwwsewnenwseswesw
        seswneswswsenwwnwse
        nwnwneseeswswnenewneswwnewseswneseene
        swweswneswnenwsewnwneneseenw
        eesenwseswswnenwswnwnwsewwnwsene
        sewnenenenesenwsewnenwwwse
        wenwwweseeeweswwwnwwe
        wsweesenenewnwwnwsenewsenwwsesesenwne
        neeswseenwwswnwswswnw
        nenwswwsewswnenenewsenwsenwnesesenew
        enewnwewneswsewnwswenweswnenwsenwsw
        sweneswneswneneenwnewenewwneswswnese
        swwesenesewenwneswnwwneseswwne
        enesenwswwswneneswsenwnewswseenwsese
        wnwnesenesenenwwnenwsewesewsesesew
        nenewswnwewswnenesenwnesewesw
        eneswnwswnwsenenwnwnwwseeswneewsenese
        neswnwewnwnwseenwseesewsenwsweewe
        wseweeenwnesenwwwswnew
        """
        let flooringPlan = FlooringPlan(string: input)
        XCTAssertEqual(flooringPlan.directions.count, input.split(separator: "\n").count)

        // Then
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 10)
    }

    func testDay24Part1() {
        // Given
        let flooringPlan = FlooringPlan(string: input)
        XCTAssertEqual(flooringPlan.directions.count, input.split(separator: "\n").count)

        // Then
        print("Part 1:", flooringPlan.amountOfBlackTiles)
    }

    func testDay24Part2Example() {
        // Given
        let input = """
        sesenwnenenewseeswwswswwnenewsewsw
        neeenesenwnwwswnenewnwwsewnenwseswesw
        seswneswswsenwwnwse
        nwnwneseeswswnenewneswwnewseswneseene
        swweswneswnenwsewnwneneseenw
        eesenwseswswnenwswnwnwsewwnwsene
        sewnenenenesenwsewnenwwwse
        wenwwweseeeweswwwnwwe
        wsweesenenewnwwnwsenewsenwwsesesenwne
        neeswseenwwswnwswswnw
        nenwswwsewswnenenewsenwsenwnesesenew
        enewnwewneswsewnwswenweswnenwsenwsw
        sweneswneswneneenwnewenewwneswswnese
        swwesenesewenwneswnwwneseswwne
        enesenwswwswneneswsenwnewswseenwsese
        wnwnesenesenenwwnenwsewesewsesesew
        nenewswnwewswnenesenwnesewesw
        eneswnwswnwsenenwnwnwwseeswneewsenese
        neswnwewnwnwseenwseesewsenwsweewe
        wseweeenwnesenwwwswnew
        """
        var flooringPlan = FlooringPlan(string: input)
        XCTAssertEqual(flooringPlan.directions.count, input.split(separator: "\n").count)
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 10)

        // Day 1
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 15)

        // Day 2
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 12)

        // Day 3
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 25)

        // Day 4
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 14)

        // Day 5
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 23)

        // Day 6
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 28)

        // Day 7
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 41)

        // Day 8
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 37)

        // Day 9
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 49)

        // Day 10
        flooringPlan.incrementDay()
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 37)

        // Day 20
        for _ in 0..<10 {
            flooringPlan.incrementDay()
        }
        XCTAssertEqual(flooringPlan.amountOfBlackTiles, 132)
    }

    func testDay24Part2() {
        // Given
        var flooringPlan = FlooringPlan(string: input)
        XCTAssertEqual(flooringPlan.directions.count, input.split(separator: "\n").count)

        // When
        for _ in 0..<100 {
            flooringPlan.incrementDay()
        }

        // Then
        print("Part 2:", flooringPlan.amountOfBlackTiles)
    }
}
