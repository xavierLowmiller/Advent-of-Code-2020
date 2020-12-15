final class ElvesGame {
    var state: [Int: Int] = [:]
    var lastNumber = 0
    var round = 0

    init(numbers: [Int]) {
        for number in numbers {
            lastNumber = number
            round += 1
            state[lastNumber] = round
        }
        state[lastNumber] = nil
    }

    func play(rounds: Int) -> Int {
        while round < rounds {
            let previousLastNumber = lastNumber

            lastNumber = round - state[lastNumber, default: round]
            state[previousLastNumber] = round

            round += 1
        }

        return lastNumber
    }
}
