func transform(subjectNumber number: Int, loopSize: Int) -> Int {
    var value = 1
    for _ in 0..<loopSize {
        value *= number
        value %= 20201227
    }
    return value
}

func findLoopSize(forSubjectNumber number: Int) -> Int {
    let initial = 7
    var value = 1
    var loopSize = 0
    while value != number {
        value *= initial
        value %= 20201227
        loopSize += 1
    }
    return loopSize
}
