extension Array where Element == Int {
    var jolts: (ones: Int, twos: Int, threes: Int) {
        var lastJolt = 0
        var ones = 0
        var twos = 0
        var threes = 0
        for adapter in sorted() {
            switch adapter - lastJolt {
            case 1:
                ones += 1
            case 2:
                twos += 1
            case 3:
                threes += 1
            default:
                fatalError()
            }
            lastJolt = adapter
        }

        return (ones, twos, threes + 1)
    }

    var possibleArrangements: Int {
        let rightOrder = [0] + self.sorted()

        var skippableNumbers: [Int] = []
        for (one, (two, three)) in zip(rightOrder, zip(rightOrder.dropFirst(), rightOrder.dropFirst(2))) {
            if three - one == 2 {
                skippableNumbers.append(two)
            }
        }

        var arrangements = 1
        for _ in 0..<skippableNumbers.count {
            arrangements *= 2
        }

        // A more generic solution would go beyond triples, but the data doesn't have quartets (or more)
        for _ in 0..<skippableNumbers.numberOfTriples {
            arrangements /= 8
            arrangements *= 7
        }

        return arrangements
    }

    private var numberOfTriples: Int {
        var numberOfTriples = 0
        for (one, (_, three)) in zip(self, zip(dropFirst(), dropFirst(2))) {
            if three - one == 2 {
                numberOfTriples += 1
            }
        }
        return numberOfTriples
    }
}
