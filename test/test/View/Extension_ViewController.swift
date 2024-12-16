import UIKit

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataForShow?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        
        cell.setUp(data: dataForShow?[indexPath.item] ?? CellData(id: "", title: "", description: "", icon: "", price: "", isSelected: false), viewWidth: Int(view.frame.width))
        
        if indexPath == selectedIndex {
            cell.showImageViewCheck()
            selectedIndexLabelMainTitle = cell.getLabelMainTitle()
            selectedIndexLabelDescription = cell.getLabelDescription()
        } else {
            cell.hideImageViewCheck()
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousIndex = selectedIndex
        selectedIndex = indexPath

        var indexPathsToReload: [IndexPath] = [indexPath]
        if let previousIndex = previousIndex, previousIndex != indexPath {
            indexPathsToReload.append(previousIndex)
        }
        collectionView.reloadItems(at: indexPathsToReload)
    }
}
