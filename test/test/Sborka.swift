import UIKit
import Foundation

class sborka {
    static func sobrat() -> UIViewController {
        let view = ViewController()
        let interactor = Interactor()
        let router = Router()
        let presenter = Presenter(router: router, interactor: interactor, view: view)
        interactor.output = presenter
        view.output = presenter
        return view
    }
}
