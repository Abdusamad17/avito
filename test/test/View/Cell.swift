import UIKit

class Cell: UICollectionViewCell {
    static var identifier = "Cell"
    
    private lazy var labelMainTitle = addLabelConstrains(text: "",
                                                         font: UIFont.systemFont(ofSize: 25, weight: .bold))
                                               
    private lazy var labelDescription = addLabelConstrains(text: "",
                                                           font: UIFont.systemFont(ofSize: 15))
    
    private lazy var labelPrice = addLabelConstrains(text: "",
                                                         font: UIFont.systemFont(ofSize: 20, weight: .bold))
    
    private lazy var imageViewCheck: UIImageView = {
        $0.image = UIImage(systemName: "checkmark.circle.fill")
        $0.tintColor = .systemBlue
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var imageViewAvatarka: UIImageView = addImageView(radius: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(labelMainTitle)
        contentView.addSubview(labelDescription)
        contentView.addSubview(labelPrice)
        contentView.addSubview(imageViewCheck)
        contentView.addSubview(imageViewAvatarka)
    }
    
    func setUp(data: CellData) {
        labelMainTitle.text = data.title
        labelDescription.text = data.description
        labelPrice.text = data.price
        imageViewAvatarka.image = UIImage(named: data.icon)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    func addViews(_ views: UIView...) {
        views.forEach({
            contentView.addSubview($0)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

