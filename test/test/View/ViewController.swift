import UIKit

protocol ViewInput {
    var output: ViewOutput? { get set }
}

protocol ViewOutput: AnyObject {
    func getDataFromURL()->Information?///TODO: данные с JSON
}

class ViewController: UIViewController, ViewInput {
    weak var output: ViewOutput?
    
    var selectedIndex: IndexPath?
    var selectedIndexLabelMainTitle: String?
    var selectedIndexLabelDescription: String?
    
    lazy var informationForShow = output?.getDataFromURL()
    lazy var dataForShow = informationForShow?.list
    
    lazy var buttonX = {
        $0.tintColor = .black
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.imageView?.clipsToBounds = true
        return $0
    }(UIButton(frame: CGRect(x: 10, y: 50, width: 50, height: 50)))
    
    lazy var labelMainTitle = addLabel(frame: CGRect(x: 20, y: 100, width: view.frame.width-40, height: 100),
//                                       text: informationForShow.title,
                                       text: "Сделайте объявление заметнее на 7 дней",
                                       font: UIFont.systemFont(ofSize: 30, weight: .bold),
                                       numberOfLines: 2)
    
    lazy var collection: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        $0.backgroundColor = .white
        $0.dataSource = self
        $0.delegate = self
        $0.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        
        return $0
    }(UICollectionView(frame: CGRect(x: 0, y: Int(labelMainTitle.frame.maxY) + 40, width: Int(view.frame.size.width), height: Int(view.frame.size.height) - 200), collectionViewLayout: UICollectionViewFlowLayout()))
    
    lazy var buttonChoose = {
        $0.addTarget(self, action: #selector(buttonChooseTapped), for: .touchUpInside)
        $0.backgroundColor = .blue
//        $0.setTitle(informationForShow.selectedActionTitle, for: .normal)
        $0.setTitle("Выбрать", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(frame: CGRect(x: 10, y: view.frame.maxY - 80, width: view.frame.width - 20, height: 50)))
    
    @objc private func buttonChooseTapped() {
        let alert = UIAlertController(title: selectedIndexLabelMainTitle, message: selectedIndexLabelDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews(buttonX, labelMainTitle, collection, buttonChoose, view: self.view)
    }
}
