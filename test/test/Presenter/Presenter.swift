import UIKit
import Foundation

protocol PresenterInput {
    var output: PresenterOutput? { get set }
}

protocol PresenterOutput: AnyObject {
    
}

final class Presenter: PresenterInput {
    weak var output: PresenterOutput?
    
    private let router: Router
    private let interactor: Interactor
    private let view: ViewController
    
    init(router: Router, interactor: Interactor, view: ViewController) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
}

extension Presenter: ViewOutput {
    func getDataFromURL() -> Information? {
        return self.sendInformation()
    }
}

extension Presenter: InteractorOutput {
    func sendInformation() -> Information? {
        return interactor.getInformation()
    }
}
