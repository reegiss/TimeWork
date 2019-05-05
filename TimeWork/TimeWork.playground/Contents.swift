import Foundation

class Teste: Codable {
    let id : Int?
    let name: String?
    
    init(id: Int?, name: String?) {
        self.id  = id
        self.name = name
    }
}

let teste = Teste.init(id: 1, name: "Teste")

print(teste.name!)

