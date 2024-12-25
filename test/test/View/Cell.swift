import UIKit

class AdCell: UICollectionViewCell {
    
    lazy var mainTitleLabel = UILabel.addLabel(
        frame: .zero,
        text: AdCell.Constants.emptyString,
        font: AdCell.Constants.fontLabelMainTitle,
        TAMIC: false
    )
    
    func getMainTitleLabel() -> String? {
        return mainTitleLabel.text
    }
    
    lazy var descriptionLabel = UILabel.addLabel(
        frame: .zero,
        text: AdCell.Constants.emptyString,
        font: AdCell.Constants.fontLabelDescription,
        TAMIC: false
    )
    
    func getDescriptionLabel() -> String? {
        return descriptionLabel.text
    }
    
    private lazy var priceLabel = UILabel.addLabel(
        frame: .zero,
        text: AdCell.Constants.emptyString,
        font: AdCell.Constants.fontLabelPrice,
        TAMIC: false
    )
    
    private lazy var checkImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "checkmark.circle.fill")
        $0.tintColor = .systemBlue
        $0.image?.withTintColor(.systemBlue)
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var avatarImageView: UIImageView = UIImageView.addImageView(
        radius: 20
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mainTitleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(checkImageView)
        contentView.addSubview(avatarImageView)
        contentView.backgroundColor = AdCell.Constants.lightGray
        contentView.layer.cornerRadius = 10
        checkImageView.isHidden = true
    }
    
    func setUp(dataForSetUp: AdDetails, viewWidth: Int) {
        mainTitleLabel.text = dataForSetUp.title
        descriptionLabel.text = dataForSetUp.description
        priceLabel.text = dataForSetUp.price
        setUpImageViewAvatarka(named: dataForSetUp.icon.x52)
//        imageViewAvatarka.image = UIImage(named: dataForSetUp.icon.x52)
        setUpConstrains()
        mainTitleLabel.widthAnchor.constraint(equalToConstant: CGFloat(viewWidth - 160)).isActive = true
    }
    
    private func setUpImageViewAvatarka(named name: String) {
        if let url = URL(string: name) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Ошибка загрузки изображения: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.avatarImageView.image = image
                    }
                }
            }.resume()
        }
    }
    
    func hiddenImageViewCheck() {
        checkImageView.isHidden = !(checkImageView.isHidden)
    }
    
    func showImageViewCheck() {
        checkImageView.isHidden = false
    }

    func hideImageViewCheck() {
        checkImageView.isHidden = true
    }

    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            
            checkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            checkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            checkImageView.heightAnchor.constraint(equalToConstant: 20),
            checkImageView.widthAnchor.constraint(equalToConstant: 20),
            
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            
            mainTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            mainTitleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            mainTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            mainTitleLabel.trailingAnchor.constraint(equalTo: checkImageView.leadingAnchor, constant: -10),
            
            priceLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: checkImageView.leadingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: checkImageView.leadingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AdCell {
    enum Constants {
        static let cellIdentifier = "AdCell"
        static let lightGray = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        static let fontLabelMainTitle = UIFont.systemFont(ofSize: 23, weight: .bold)
        static let fontLabelDescription = UIFont.systemFont(ofSize: 16)
        static let emptyString = ""
        static let fontLabelPrice = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
}
