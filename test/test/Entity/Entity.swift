import UIKit
import Foundation

struct Information {
    var status: String
    var title: String
    var actionTitle: String
    var selectedActionTitle: String
    static var list: [CellData] = [CellData(id: "id1",
                                    title: "XL-объявление",
                                    description: "Пользователи смогут посмотреть фотографии, описание и телефон прям из результатов поиска.",
                                    icon: "XL",
                                    price: "356 Р",
                                    isSelected: false),
                                   CellData(id: "id2",
                                    title: "Выделить цветом",
                                    description: "Яркий цвет не даст затеряться среди других объявлений.",
                                    icon: "highlight",
                                    price: "299 Р",
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


