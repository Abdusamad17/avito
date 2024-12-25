import UIKit
import Foundation

class AdModuleAssembly {
    static func assemble() -> UIViewController {
        let view = ViewController()
        let interactor = AdModuleInteractor()
        let router = Router()
        let presenter = AdModulePresenter(router: router, interactor: interactor, view: view)
        interactor.output = presenter
        view.output = presenter
        return view
    }
}
