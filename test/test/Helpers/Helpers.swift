import Foundation
import UIKit

func addViews(_ views: UIView..., view: UIView) {
    views.forEach({
        view.addSubview($0)
    })
}
