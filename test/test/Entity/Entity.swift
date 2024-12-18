import UIKit
import Foundation

struct Information: Decodable {
    var status: String
    var result: Result
}

struct Result: Decodable {
    var title: String
    var actionTitle: String
    var selectedActionTitle: String
    var list: [CellData]
}

struct CellData: Decodable {
    var id: String
    var title: String
    var description: String
    var icon: Icon
    var price: String
    var isSelected: Bool
}

struct Icon: Decodable {
    var x52: String
}

