import Foundation
import UIKit

func addButton(title: String, backgroundColor: UIColor, titleColor: UIColor, font: UIFont, radius: CGFloat) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.setTitleColor(titleColor, for: .normal)
    button.backgroundColor = backgroundColor
    button.layer.cornerRadius = radius
    return button
}

func addImageView(radius: CGFloat) -> UIImageView {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = radius
    return imageView
}

func addLabel(text: String, textColor: UIColor = .black, font: UIFont) -> UILabel {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = font
    label.textColor = textColor
    label.backgroundColor = .clear
    label.text = text
    return label
}
