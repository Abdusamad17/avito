import UIKit

protocol ViewInput {
    var output: ViewOutput? { get set }
}

protocol ViewOutput {
    func buttonChooseTapped(button: UIButton)
}

final class ViewController: UIViewController, ViewInput {
    var dataForShow = Information.list
    var output: ViewOutput?
    
    let buttonX = {
        
        return $0
    }(UIButton())
    
    let labelMainTitle = {
        
        return $0
    }(UILabel())
    
    lazy var collection: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.contentInset = UIEdgeInsets(top: 52, left: 30, bottom: 0, right: 30)
        
        $0.backgroundColor = .white
        $0.dataSource = self
        $0.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))
    
    let buttonChoose = {
        
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collection)
        view.addSubview(buttonX)
        view.addSubview(labelMainTitle)
        view.addSubview(buttonChoose)
    }
    //...
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
