import Foundation

struct Food {
    var ingredients: Set<String>
    var allergens: Set<String>
}

extension Food {
    init<S: StringProtocol>(string: S) {
        ingredients = Set(string.components(separatedBy: " (")[0].components(separatedBy: " "))
        allergens = Set(string.components(separatedBy: " (")[1]
                            .dropLast(1).components(separatedBy: "contains ")[1]
                            .components(separatedBy: ", "))
    }
}

func ingredientsWithoutAllergens(_ input: String) -> [String] {
    var food = input.split(separator: "\n").map(Food.init)

    var allIngredients = Set(food.flatMap(\.ingredients))
    var allAllergens = Set(food.flatMap(\.allergens))

    while !allAllergens.isEmpty {
        for allergen in allAllergens {
            let allFoodsContainingAllergen = food.filter({ $0.allergens.contains(allergen) })
            let commonIngredients = allFoodsContainingAllergen.map(\.ingredients).reduce(into: allFoodsContainingAllergen.first!.ingredients) {
                $0.formIntersection($1)
            }
            if commonIngredients.count == 1 {
                let ingredient = commonIngredients.first!
                food = food.map {
                    Food(
                    ingredients: $0.ingredients.filter { $0 != ingredient },
                    allergens: $0.allergens.filter { $0 != allergen }
                    )
                }
                allIngredients.remove(ingredient)
                allAllergens.remove(allergen)
                break
            }
        }
    }

    return food.flatMap(\.ingredients)
}

func dangerousIngredients(_ input: String) -> String {
    var food = input.split(separator: "\n").map(Food.init)

    var allIngredients = Set(food.flatMap(\.ingredients))
    var allAllergens = Set(food.flatMap(\.allergens))

    var mapping: [String: String] = [:]

    while !allAllergens.isEmpty {
        for allergen in allAllergens {
            let allFoodsContainingAllergen = food.filter({ $0.allergens.contains(allergen) })
            let commonIngredients = allFoodsContainingAllergen.map(\.ingredients).reduce(into: allFoodsContainingAllergen.first!.ingredients) {
                $0.formIntersection($1)
            }
            if commonIngredients.count == 1 {
                let ingredient = commonIngredients.first!
                food = food.map {
                    Food(
                    ingredients: $0.ingredients.filter { $0 != ingredient },
                    allergens: $0.allergens.filter { $0 != allergen }
                    )
                }
                allIngredients.remove(ingredient)
                allAllergens.remove(allergen)
                mapping[allergen] = ingredient
                break
            }
        }
    }

    var dangerousIngredients: [String] = []
    for key in mapping.keys.sorted() {
        dangerousIngredients.append(mapping[key]!)
    }

    return dangerousIngredients.joined(separator: ",")
}
