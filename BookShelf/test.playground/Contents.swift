import UIKit


struct Dog: Identifiable {
    var id: ObjectIdentifier
    
    var name: String
    var age: Int
}

class Person: Identifiable {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let bee = Person(name: "Bee", age: 10)
let peach = Person(name: "Peach", age: 20)

print(bee.id)
print(peach.id)
