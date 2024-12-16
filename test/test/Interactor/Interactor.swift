import UIKit
import Foundation

protocol InteractorInput {
    var output: InteractorOutput? { get set }
    func getInformation() -> Information?
}

protocol InteractorOutput: AnyObject {
    func sendInformation() -> Information?
}

final class Interactor: InteractorInput {
    weak var output: InteractorOutput?
    
    func getInformation() -> Information? {
        ///TODO: запрос в сеть и парсинг JSON
        return Information(status: "status0",
                           title: "title0",
                           actionTitle: "actionTitle0",
                           selectedActionTitle: "selectedActionTitle0")
    }
}
