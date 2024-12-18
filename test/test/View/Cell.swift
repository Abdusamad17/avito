import UIKit

class Cell: UICollectionViewCell {
    static var identifier = "Cell"
    
    private lazy var labelMainTitle = addLabelConstrains(text: "",
                                                         font: UIFont.systemFont(ofSize: 23, weight: .bold))
    
    func getLabelMainTitle()->String? {return labelMainTitle.text}
    
    private lazy var labelDescription = addLabelConstrains(text: "",
                                                           font: UIFont.systemFont(ofSize: 16))
    
    func getLabelDescription()->String? {return labelDescription.text}
    
    private lazy var labelPrice = addLabelConstrains(text: "",
                                                         font: UIFont.systemFont(ofSize: 18, weight: .bold))
    
    private lazy var imageViewCheck: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "checkmark.circle.fill")
        $0.tintColor = .systemBlue
        $0.image?.withTintColor(.systemBlue)
        $0.contentMode = .scaleAspectFit
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
        contentView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        contentView.layer.cornerRadius = 10
        imageViewCheck.isHidden = true
    }
    
    func setUp(dataForSetUp: CellData, viewWidth: Int) {
        labelMainTitle.text = dataForSetUp.title
        labelDescription.text = dataForSetUp.description
        labelPrice.text = dataForSetUp.price
        setUpImageViewAvatarka(named: dataForSetUp.icon.x52)
//        imageViewAvatarka.image = UIImage(named: dataForSetUp.icon.x52)
        setUpConstrains()
        labelMainTitle.widthAnchor.constraint(equalToConstant: CGFloat(viewWidth - 160)).isActive = true
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
                        self.imageViewAvatarka.image = image
                    }
                }
            }.resume()
        }
    }
    
    func hiddenImageViewCheck() {
        imageViewCheck.isHidden = !(imageViewCheck.isHidden)
    }
    
    func showImageViewCheck() {
        imageViewCheck.isHidden = false
    }

    func hideImageViewCheck() {
        imageViewCheck.isHidden = true
    }

    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            
            imageViewCheck.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            imageViewCheck.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageViewCheck.heightAnchor.constraint(equalToConstant: 20),
            imageViewCheck.widthAnchor.constraint(equalToConstant: 20),
            
            imageViewAvatarka.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageViewAvatarka.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageViewAvatarka.heightAnchor.constraint(equalToConstant: 50),
            imageViewAvatarka.widthAnchor.constraint(equalToConstant: 50),
            
            labelMainTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            labelMainTitle.leadingAnchor.constraint(equalTo: imageViewAvatarka.trailingAnchor, constant: 10),
            labelMainTitle.heightAnchor.constraint(equalToConstant: 25),
            labelMainTitle.trailingAnchor.constraint(equalTo: imageViewCheck.leadingAnchor, constant: -10),
            
            labelPrice.leadingAnchor.constraint(equalTo: imageViewAvatarka.trailingAnchor, constant: 10),
            labelPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            labelPrice.heightAnchor.constraint(equalToConstant: 20),
            labelPrice.trailingAnchor.constraint(equalTo: imageViewCheck.leadingAnchor, constant: -10),
            
            labelDescription.topAnchor.constraint(equalTo: labelMainTitle.bottomAnchor, constant: 5),
            labelDescription.leadingAnchor.constraint(equalTo: imageViewAvatarka.trailingAnchor, constant: 10),
            labelDescription.trailingAnchor.constraint(equalTo: imageViewCheck.leadingAnchor, constant: -10),
            labelDescription.bottomAnchor.constraint(equalTo: labelPrice.topAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
