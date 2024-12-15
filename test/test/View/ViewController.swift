import UIKit

protocol ViewInput {
    var output: ViewOutput? { get set }
}

protocol ViewOutput {
    func buttonChooseTapped(button: UIButton)
}

class ViewController: UIViewController, ViewInput {
    var informationForShow = Information(status: "status0",
                                         title: "title0",
                                         actionTitle: "actionTitle0",
                                         selectedActionTitle: "selectedActionTitle0")
    
    var dataForShow = Information.list
    var output: ViewOutput?
    
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
        $0.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        $0.backgroundColor = .white
        $0.dataSource = self
        $0.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        
        return $0
    }(UICollectionView(frame: CGRect(x: 0, y: Int(labelMainTitle.frame.maxY) + 40, width: Int(view.frame.size.width), height: Int(view.frame.size.height) - 200), collectionViewLayout: UICollectionViewFlowLayout()))
    
    lazy var buttonChoose = {
        $0.backgroundColor = .blue
//        $0.setTitle(informationForShow.selectedActionTitle, for: .normal)
        $0.setTitle("Выбрать", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(frame: CGRect(x: 10, y: view.frame.maxY - 80, width: view.frame.width - 20, height: 50), primaryAction: UIAction{_ in
        //...
    }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews(buttonX, labelMainTitle, collection, buttonChoose, view: self.view)
    }
}
