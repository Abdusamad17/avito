import Foundation
import UIKit

extension UILabel {
    static func addLabel(frame: CGRect, text: String, textColor: UIColor = .black, font: UIFont, numberOfLines: Int = 0, TAMIC: Bool = true) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = TAMIC
        label.frame = frame
        label.numberOfLines = numberOfLines
        label.textAlignment = .left
        label.font = font
        label.textColor = textColor
        label.backgroundColor = .clear
        label.text = text
        return label
    }
}
