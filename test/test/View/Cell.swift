import UIKit

class Cell: UICollectionViewCell {
    static var identifier = "Cell"
    
    private lazy var smallView: UIView = {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 10
        return $0
    }(UIView())
    
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
//        $0.isHidden = true
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
        contentView.addSubview(smallView)
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
            smallView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            smallView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            smallView.heightAnchor.constraint(equalToConstant: 1),
            smallView.widthAnchor.constraint(equalToConstant: 100),
            smallView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            imageViewAvatarka.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageViewAvatarka.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageViewAvatarka.heightAnchor.constraint(equalToConstant: 50),
            imageViewAvatarka.widthAnchor.constraint(equalToConstant: 50),
            
            imageViewCheck.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            imageViewCheck.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageViewCheck.heightAnchor.constraint(equalToConstant: 20),
            imageViewCheck.widthAnchor.constraint(equalToConstant: 20),
            
            labelMainTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            labelMainTitle.leadingAnchor.constraint(equalTo: imageViewAvatarka.leadingAnchor, constant: 10),
            labelMainTitle.heightAnchor.constraint(equalToConstant: 30),
            labelMainTitle.trailingAnchor.constraint(equalTo: imageViewCheck.trailingAnchor, constant: -10),
            
            labelPrice.leadingAnchor.constraint(equalTo: imageViewAvatarka.leadingAnchor, constant: 10),
            labelPrice.trailingAnchor.constraint(equalTo: imageViewCheck.trailingAnchor, constant: -10),
            labelPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            labelPrice.heightAnchor.constraint(equalToConstant: 25),
            
            labelDescription.topAnchor.constraint(equalTo: labelMainTitle.topAnchor, constant: 10),
            labelDescription.leadingAnchor.constraint(equalTo: imageViewAvatarka.leadingAnchor, constant: 10),
            labelDescription.trailingAnchor.constraint(equalTo: imageViewCheck.trailingAnchor, constant: -10),
            labelDescription.bottomAnchor.constraint(equalTo: labelPrice.topAnchor, constant: -20)
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

