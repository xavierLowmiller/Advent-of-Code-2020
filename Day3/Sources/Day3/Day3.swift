struct Slope {
  let trees: [[Bool]]

  init(string: String) {
    trees = string.split(separator: "\n")
      .map {
        $0.map { $0 == "#" }
      }
  }

  func treesWhileSliding(x: Int, y: Int) -> Int {
    var currentX = 0
    var currentY = 0
    var treesEncountered = 0
    while currentY < trees.count {
      if trees[currentY][currentX] {
        treesEncountered += 1
      }
      currentX += x
      currentY += y
      
      currentX %= trees[0].count
    }
    return treesEncountered
  }
}
