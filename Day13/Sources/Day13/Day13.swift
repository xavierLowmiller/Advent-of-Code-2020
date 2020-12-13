func findNextBus(_ input: String) -> (id: Int, waitTime: Int) {
    let currentTime = Int(input.split(separator: "\n")[0])!

    let buses = input.split(separator: "\n")[1]
        .split(separator: ",")
        .compactMap { Int($0) }

    return buses
        .map { ($0, abs(currentTime % $0 - $0)) }
        .min(by: { $0.1 < $1.1 }) ?? (0, 0)
}

func euclideanAlgorithm(_ m: Int, _ n: Int) -> (Int, Int) {
    if m % n == 0 {
        return (0, 1)
    } else {
        let rs = euclideanAlgorithm(n % m, m)
        let r = rs.1 - rs.0 * (n / m)
        let s = rs.0

        return (r, s)
    }
}

func gcd(_ m: Int, _ n: Int) -> Int {
    let rs = euclideanAlgorithm(m, n)
    return m * rs.0 + n * rs.1
}

func chineseRemainderTheorem(_ a_i: [Int], _ n_i: [Int]) -> Int {

    // Calculate factor N
    let N = n_i.map { $0 }.reduce(1, *)

    // Using euclidean algorithm to calculate r_i, s_i
    let s = n_i.reduce(into: []) { s, n in
        s.append(euclideanAlgorithm(n, N / n).1)
    }

    // Solve for x
    let x = a_i.enumerated().reduce(0) {
        $0 + $1.1 * s[$1.0] * (N / n_i[$1.0])
    }

    // Return minimal solution
    return abs(x % N)
}
