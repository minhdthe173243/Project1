
import UIKit


struct ResultItems: Codable{
    var quote: String
    var anime: String
    var id: Int
    var name: String
}

struct Result: Codable {
    var  data: [ResultItems]
}




