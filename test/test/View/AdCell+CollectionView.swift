import UIKit

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataForShow?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCell.Constants.cellIdentifier, for: indexPath) as? AdCell else {
            return UICollectionViewCell()
        }
        
        cell.setUp(dataForSetUp: dataForShow?[indexPath.item] ?? AdDetails(id: "", title: "", description: "", icon: AdIcon(x52: ""), price: "", isSelected: false), viewWidth: Int(view.frame.width))
        
        if indexPath == selectedIndex {
            cell.showImageViewCheck()
            selectedIndexLabelMainTitle = cell.mainTitleLabel.text
            selectedIndexLabelDescription = cell.descriptionLabel.text
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
