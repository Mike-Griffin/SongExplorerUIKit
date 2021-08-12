//
//  SearchResultsCollectionVC.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/7/21.
//

import UIKit

class SearchResultsCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var results: [SongPreview] = []
    
    override func viewDidLoad() {
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: CellId.cellId)
        collectionView.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let songVC = SongDetailViewController(song:results[indexPath.item])
        navigationController?.pushViewController(songVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.cellId, for: indexPath) as? SearchResultCell {
            cell.backgroundColor = .systemPink
            cell.titleLabel.text = results[indexPath.item].censoredTitle
            return cell
        } else {
            fatalError("Failed to dequeue as Search Result Cell")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
}
