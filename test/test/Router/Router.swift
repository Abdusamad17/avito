import UIKit
import Foundation

protocol RouterInput {
    func presentEmptyViewController(viewController: UIViewController)
}

final class Router: RouterInput {
    func presentEmptyViewController(viewController: UIViewController) {
        let emptyView = EmptyViewController()
        viewController.navigationController?.pushViewController(emptyView, animated: true)
    }
}
