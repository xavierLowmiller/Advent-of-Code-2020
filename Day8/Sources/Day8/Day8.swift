import Foundation

class Program {
    private var instructions: [Instruction]
    private var pc = 0
    private var acc = 0
    init(string: String) {
        instructions = string.split(separator: "\n").compactMap(Instruction.init)
    }

    func checkForInifiniteLoop() -> (isLoop: Bool, acc: Int) {
        var pcHistory: [Int] = []
        while pc < instructions.count {
            guard !pcHistory.contains(pc) else { return (true, acc) }
            pcHistory.append(pc)
            run()
        }
        return (false, acc)
    }

    func fuzzProgram() -> Int? {
        for (index, instruction) in instructions.enumerated() {
            // Try changing `nop` to `jmp`
            if case let .nop(int) = instruction {
                instructions[index] = .jmp(int)
                let (isLoop, acc) = checkForInifiniteLoop()
                if isLoop {
                    instructions[index] = .nop(int)
                    pc = 0
                    self.acc = 0
                } else {
                    return acc
                }
            }
            // Try changing `jmp` to `nop`
            if case let .jmp(int) = instruction {
                instructions[index] = .nop(int)
                let (isLoop, acc) = checkForInifiniteLoop()
                if isLoop {
                    instructions[index] = .jmp(int)
                    pc = 0
                    self.acc = 0
                } else {
                    return acc
                }
            }
        }
        return nil
    }

    func run() {
        switch instructions[pc] {
        case .nop:
            pc += 1
        case .acc(let int):
            acc += int
            pc += 1
        case .jmp(let int):
            pc += int
        }
    }
}

enum Instruction: Equatable {
    case nop(Int)
    case acc(Int)
    case jmp(Int)

    init?<S: StringProtocol>(string: S) {
        let components = string.split(separator: " ")
        guard components.count == 2, let int = Int(components[1])
        else { return nil}
        switch components[0] {
        case "nop":
            self = .nop(int)
        case "acc":
            self = .acc(int)
        case "jmp":
            self = .jmp(int)
        default:
            return nil
        }
    }
}
