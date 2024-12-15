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
    
    lazy var labelMainTitle = addLabel(text: informationForShow.title,
                                       //text: "Сделайте объявление заметнее на 7 дней",
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
    }(UICollectionView(frame: CGRect(x: 0, y: 150, width: Int(view.frame.size.width), height: Int(view.frame.size.height) - 200), collectionViewLayout: UICollectionViewFlowLayout()))
    
    lazy var buttonChoose = {
        $0.backgroundColor = .blue
        $0.setTitle(informationForShow.selectedActionTitle, for: .normal)
        //$0.setTitle("Выбрать", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(frame: CGRect(x: 10, y: view.frame.maxY - 80, width: view.frame.width - 20, height: 50), primaryAction: UIAction{_ in
        
    }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        view.addSubview(collection)
        view.addSubview(buttonX)
        view.addSubview(labelMainTitle)
        view.addSubview(buttonChoose)
        setUpConstrains()
    }
    
    func setUpConstrains() {
        NSLayoutConstraint.activate([
            labelMainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: buttonX.frame.minY + 50),
            labelMainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelMainTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelMainTitle.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataForShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else {return UICollectionViewCell()}
        cell.setUp(data: dataForShow[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //показать или скрыть галочку
    }
}

class Cell: UICollectionViewCell {
    static let identifier = "Cell"
    
    func setUp(data: CellData) {
        
    }
}
