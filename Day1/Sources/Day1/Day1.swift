extension Array where Element == Int {
    func tupleOfSum(_ sum: Int) -> (Int, Int)? {
        for i in self {
            for j in self {
                if i + j == sum {
                    return (i, j)
                }
            }
        }

        return nil
    }

    func tripleOfSum(_ sum: Int) -> (Int, Int, Int)? {
        for i in self {
            for j in self {
                for k in self {
                    if i + j + k == sum {
                        return (i, j, k)
                    }
                }
            }
        }

        return nil
    }
}
