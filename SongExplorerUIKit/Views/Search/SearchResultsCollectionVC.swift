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
        print(results[indexPath.item].censoredTitle)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.cellId, for: indexPath) as? SearchResultCell {
            cell.backgroundColor = .systemPink
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
