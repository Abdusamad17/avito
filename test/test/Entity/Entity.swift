import UIKit
import Foundation

struct Information {
    var status: String
    var title: String
    var actionTitle: String
    var selectedActionTitle: String
    static var list: [CellData] = [CellData(id: "id1",
                                    title: "title1",
                                    description: "description1",
                                    icon: "icon1",
                                    price: "price1",
                                    isSelected: false),
                                   CellData(id: "id2",
                                    title: "title2",
                                    description: "description2",
                                    icon: "icon2",
                                    price: "price2",
                                    isSelected: false)]
}

struct CellData {
    var id: String
    var title: String
    var description: String
    var icon: String
    var price: String
    var isSelected: Bool
}


