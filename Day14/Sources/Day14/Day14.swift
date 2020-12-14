import Foundation

final class Program {
    private var state: [UInt: UInt] = [:]

    private var mask = ""

    var checkSum: UInt {
        state.map(\.value).reduce(0, +)
    }

    private func updateMask(_ line: Substring) {
        mask = String(line.split(separator: "=")[1].trimmingCharacters(in: .whitespaces))
    }
}

extension Program {
    func runV1(_ input: String) {
        for line in input.split(separator: "\n") {
            if line.hasPrefix("mask") {
                updateMask(line)
            } else {
                updateMemoryV1(line)
            }
        }
    }

    private func updateMemoryV1(_ line: Substring) {
        let value = UInt(line.split(separator: "=")[1].trimmingCharacters(in: .whitespaces))!
        let key = UInt(line.split(separator: "]")[0].split(separator: "[")[1])!
        state[key] = value.applyingMaskV1(mask)
    }
}

extension Program {
    func runV2(_ input: String) {
        for line in input.split(separator: "\n") {
            if line.hasPrefix("mask") {
                updateMask(line)
            } else {
                updateMemoryV2(line)
            }
        }
    }

    private func updateMemoryV2(_ line: Substring) {
        let value = UInt(line.split(separator: "=")[1].trimmingCharacters(in: .whitespaces))!
        let key = UInt(line.split(separator: "]")[0].split(separator: "[")[1])!
        key.applyingMaskV2(mask).forEach {
            print(key)
            state[$0] = value
        }
    }
}

private extension UInt {
    mutating func applyMaskV1(_ mask: String) {
        let andMask = UInt(bitString: mask.replacingOccurrences(of: "X", with: "1"))
        let orMask = UInt(bitString: mask.replacingOccurrences(of: "X", with: "0"))
        self = self | orMask & andMask
    }

    func applyingMaskV1(_ mask: String) -> UInt {
        var copy = self
        copy.applyMaskV1(mask)
        return copy
    }

    func applyingMaskV2(_ mask: String) -> [UInt] {
        let xCount = mask.filter { $0 == "X" }.count
        var bitMask = Array(repeating: UInt(0), count: xCount)

        var masks: [UInt] = []
        let cleanMask = UInt(bitString: mask
                                .replacingOccurrences(of: "0", with: "1")
                                .replacingOccurrences(of: "X", with: "0"))
        while bitMask != Array(repeating: UInt(1), count: xCount) {
            var currentBitMask = bitMask
            var currentMask = Array(mask)
            for (index, char) in currentMask.enumerated() where char == "X" {
                let bit = currentBitMask.removeFirst()
                currentMask[index] = Character(String(bit))
            }
            let orMask = UInt(bitString: String(currentMask))
            masks.append((self & cleanMask) | orMask)
            bitMask.increment()
        }
        var currentBitMask = bitMask
        var currentMask = Array(mask)
        for (index, char) in currentMask.enumerated() where char == "X" {
            let bit = currentBitMask.removeFirst()
            currentMask[index] = Character(String(bit))
        }
        let orMask = UInt(bitString: String(currentMask))
        masks.append((self & cleanMask) | orMask)
        print(masks)
        return masks
    }

    init(bitString: String) {
        var int: UInt = 0
        for c in bitString {
            int <<= 1
            int |= UInt(String(c))!
        }
        self = int
    }
}

private extension Array where Element == UInt {
    mutating func increment() {
        increment(at: count - 1)
    }

    private mutating func increment(at index: Index) {
        guard index >= 0 else { return }
        if self[index] == 0 {
            self[index] = 1
        } else {
            self[index] = 0
            increment(at: index - 1)
        }
    }
}
