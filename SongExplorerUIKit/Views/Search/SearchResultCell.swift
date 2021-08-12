//
//  SearchResultCell.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/7/21.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        titleLabel.anchorCenter(centerX: safeAreaLayoutGuide.centerXAnchor,
                                centerY: safeAreaLayoutGuide.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
