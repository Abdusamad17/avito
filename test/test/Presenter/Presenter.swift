import UIKit
import Foundation

protocol AdModulePresenterInput {
    var output: AdModulePresenterOutput? { get set }
}

protocol AdModulePresenterOutput: AnyObject {
    
}

final class AdModulePresenter: AdModulePresenterInput {
    weak var output: AdModulePresenterOutput?
    
    private let router: Router
    private let interactor: AdModuleInteractor
    private let view: ViewController
    
    init(router: Router, interactor: AdModuleInteractor, view: ViewController) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
}

extension AdModulePresenter: ViewOutput {
    func presentView(forView: UIViewController) {
        router.presentEmptyViewController(viewController: forView)
    }
    
    func getDataFromURL() -> AdResponse? {
        return self.send()
    }
}

extension AdModulePresenter: AdModuleInteractorOutput {
    func send() -> AdResponse? {
        return interactor.load()
    }
}
