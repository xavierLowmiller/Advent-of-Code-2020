extension Array where Element == Int {
    func verifyCipher(preambleSize: Int, offset: Int = 0) -> Int? {
        let window = self.dropFirst(offset).prefix(preambleSize)
        guard let number = self.dropFirst(offset + preambleSize).first
        else { return nil }

        var pairExists = false

        outerLoop: for number1 in window {
            for number2 in window {
                if number1 + number2 == number {
                    pairExists = true
                    break outerLoop
                }
            }
        }

        if pairExists {
            return verifyCipher(preambleSize: preambleSize, offset: offset + 1)
        } else {
            return number
        }
    }

    func findWeakness(preambleSize: Int) -> Int? {
        guard let invalidCipher = verifyCipher(preambleSize: preambleSize),
              let indexOfInvalidCipher = firstIndex(of: invalidCipher)
        else { return nil }

        for lowerBound in 0..<indexOfInvalidCipher {
            for upperBound in (0..<indexOfInvalidCipher).dropFirst(lowerBound) {
                let range = self[lowerBound...upperBound]

                switch range.reduce(0, +) {
                case ..<invalidCipher:
                    continue
                case invalidCipher:
                    return range.min()! + range.max()!
                default:
                    break
                }
            }
        }

        return nil
    }
}
