extension Array where Element == Int {
    func verifyCipher(preambleSize: Int, offset: Int = 0) -> Int? {
        let window = dropFirst(offset).prefix(preambleSize)
        guard let number = dropFirst(offset + preambleSize).first else { return nil }

        for number1 in window {
            for number2 in window {
                if number1 + number2 == number {
                    return verifyCipher(preambleSize: preambleSize, offset: offset + 1)
                }
            }
        }

        return number
    }

    func findWeakness(preambleSize: Int) -> Int? {
        guard let invalidCipher = verifyCipher(preambleSize: preambleSize),
              let indexOfInvalidCipher = firstIndex(of: invalidCipher)
        else { return nil }

        var lowerBound: Index = 0
        var upperBound: Index = 0
        while lowerBound < indexOfInvalidCipher, upperBound < indexOfInvalidCipher {
            let range = self[lowerBound...upperBound]

            switch range.reduce(0, +) {
            case ..<invalidCipher:
                // Sum of range is too low -> Make range bigger
                upperBound += 1
            case invalidCipher:
                // Sum of range matches invalid cipher -> found the weakness!
                return range.min()! + range.max()!
            default:
                // Sum of range is high low -> Make range smaller
                lowerBound += 1
            }
        }

        return nil
    }
}
