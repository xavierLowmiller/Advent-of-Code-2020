public struct CrabCups {

    public var state: [Int]
    public var currentCup = 0

    public init(string: String, amountOfCups: Int = 9) {
        state = Array(1...amountOfCups + 1)

        let numberInput = Array(string).compactMap { $0.wholeNumberValue }
        currentCup = numberInput[0]
        for (number1, number2) in zip(numberInput, numberInput.dropFirst()) {
            state[number1] = number2
        }
        let lastNumber = numberInput.last!
        if numberInput.count < amountOfCups {
            state[lastNumber] = numberInput.count + 1
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

        while numberToRelocate1 == destination
                || numberToRelocate2 == destination
                || numberToRelocate3 == destination {
            destination = (destination + modulo - 2) % modulo + 1
        }

        state[currentCup] = state[numberToRelocate3]
        state[numberToRelocate3] = state[destination]
        state[destination] = numberToRelocate1
        currentCup = state[currentCup]
    }

    public var answerPart1: Int {
        var current = state[1]
        var answer = 0
        while current != 1 {
            answer *= 10
            answer += current
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
