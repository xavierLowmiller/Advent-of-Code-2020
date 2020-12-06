import Foundation

struct TravelGroup {
    let amountOfPeople: Int
    let questions: [Character: Int]

    var questionsEveryoneAnsweredWithYes: Int {
        questions
            .map(\.value)
            .filter({ $0 == amountOfPeople })
            .count
    }

    init(string: String) {
        let answersGiven = string.components(separatedBy: "\n")
        amountOfPeople = answersGiven.count
        questions = answersGiven
            .map { Dictionary.init(grouping: $0, by: { $0 }).mapValues(\.count) }
            .reduce(into: [:]) { $0.merge($1) { $0 + $1 } }
    }
}

struct CustomsForm {
    let groups: [TravelGroup]

    // Answer for part 1
    var questionsCount: Int {
        groups.map { $0.questions.count }.reduce(0, +)
    }

    // Answer for part 2
    var amountOfQuestionsEveryoneAnsweredWithYes: Int {
        groups.map(\.questionsEveryoneAnsweredWithYes).reduce(0, +)
    }

    init(string: String) {
        groups = string.components(separatedBy: "\n\n").map(TravelGroup.init)
    }
}
