extension Array where Element == Int {
    var tupleOf2020: (Int, Int)? {
        for i in self {
            for j in self {
                if i + j == 2020 {
                    return (i, j)
                }
            }
        }

        return nil
    }

    var tripleOf2020: (Int, Int, Int)? {
        for i in self {
            for j in self {
                for k in self {
                    if i + j + k == 2020 {
                        return (i, j, k)
                    }
                }
            }
        }

        return nil
    }
}
