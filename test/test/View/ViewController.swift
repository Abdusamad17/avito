import UIKit

protocol ViewInput {
    var output: ViewOutput? { get set }
}

protocol ViewOutput: AnyObject {
    func getDataFromURL() -> AdResponse?/// данные с JSON
    func presentView(forView: UIViewController)
}

class ViewController: UIViewController, ViewInput {
    weak var output: ViewOutput?
    
    var selectedIndex: IndexPath?
    var selectedIndexLabelMainTitle: String?
    var selectedIndexLabelDescription: String?
    
    lazy var informationForShow = output?.getDataFromURL()
    lazy var dataForShow = informationForShow?.result.list
    
    lazy var closeButton = {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
        $0.imageView?.contentMode = .scaleAspectFit
        $0.imageView?.clipsToBounds = true
        return $0
    }(UIButton(frame: CGRect(x: 10, y: 50, width: 50, height: 50)))
    
    lazy var mainTitleLabel = UILabel.addLabel(
        frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 100),
//        text: informationForShow.title,
        text: "Сделайте объявление заметнее на 7 дней",
        font: UIFont.systemFont(ofSize: 30, weight: .bold),
        numberOfLines: 2
    )
    
    lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        $0.backgroundColor = .white
        $0.dataSource = self
        $0.delegate = self
        $0.register(AdCell.self, forCellWithReuseIdentifier: AdCell.Constants.cellIdentifier)
        
        return $0
    }(UICollectionView(frame: CGRect(x: 0, y: Int(mainTitleLabel.frame.maxY) + 40, width: Int(view.frame.size.width), height: Int(view.frame.size.height) - 200), collectionViewLayout: UICollectionViewFlowLayout()))
    
    lazy var chooseButton = {
        $0.addTarget(self, action: #selector(chooseButtonTapped), for: .touchUpInside)
        $0.backgroundColor = .blue
//        $0.setTitle(informationForShow.selectedActionTitle, for: .normal)
        $0.setTitle("Выбрать", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(frame: CGRect(x: 10, y: view.frame.maxY - 80, width: view.frame.width - 20, height: 50)))
    
    @objc private func chooseButtonTapped() {
        
        /// alert
//        let alert = UIAlertController(title: selectedIndexLabelMainTitle, message: selectedIndexLabelDescription, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default)
//        alert.addAction(okAction)
//        present(alert, animated: true)
        
        /// navigation
        self.output?.presentView(forView: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews(closeButton, mainTitleLabel, collectionView, chooseButton, view: self.view)
    }
}
