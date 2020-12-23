public struct CrabCups {
    // A mapping from cup to its follower
    public var state: [Int]
    public var currentCup = 0

    public init(string: String, amountOfCups: Int = 9) {
        state = Array(repeating: 0, count: amountOfCups + 1)
        let allNumbers = Array(string).compactMap({ $0.wholeNumberValue })
        for (number1, number2) in zip(allNumbers, allNumbers.dropFirst()) {
            if currentCup == 0 {
                currentCup = number1
            }
            state[number1] = number2
        }
        let lastNumber = allNumbers.last!
        if allNumbers.count < amountOfCups {
            for (number1, number2) in zip(1..<amountOfCups, 2..<amountOfCups + 1).dropFirst(allNumbers.count) {
                state[number1] = number2
            }
            state[lastNumber] = allNumbers.count + 1
            state[amountOfCups] = currentCup
        } else {
            state[lastNumber] = currentCup
        }
    }

    mutating public func playRound() {
        let numberToRelocate1 = state[currentCup]
        let numberToRelocate2 = state[numberToRelocate1]
        let numberToRelocate3 = state[numberToRelocate2]
        let modulo = state.count - 1
        var destination = (currentCup + modulo - 2) % modulo + 1
        while [numberToRelocate1, numberToRelocate2, numberToRelocate3].contains(destination) {
            destination = (destination + modulo - 2) % modulo + 1
        }

        state[currentCup] = state[numberToRelocate3]
        state[numberToRelocate3] = state[destination]
        state[destination] = numberToRelocate1
        currentCup = state[currentCup]
    }

    public var answerPart1: String {
        var current = state[1]
        var answer = ""
        while current != 1 {
            answer += "\(current)"
            current = state[current]
        }
        return answer
    }

    public var answerPart2: Int {
        let number1 = state[1]
        let number2 = state[number1]

        return number1 * number2
    }
}
