//
//  SongDetailViewController.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/11/21.
//

import UIKit

class SongDetailViewController: UIViewController {
    let song: SongPreview
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(song: SongPreview) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        addSubviews()
        updateUI()
        configureConstraints()
    }
    
    func updateUI() {
        view.backgroundColor = .white
        label.text = song.censoredTitle
        artistNameLabel.text = "By: \(song.artist.name)"
    }
    
    func addSubviews() {
        view.addSubview(label)
        view.addSubview(artistNameLabel)
    }
    
    func configureConstraints() {
        label.anchorCenter(centerX: view.safeAreaLayoutGuide.centerXAnchor,
                           centerY: view.safeAreaLayoutGuide.centerYAnchor)
        artistNameLabel.anchor(top: label.bottomAnchor,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: nil,
                               trailing: view.safeAreaLayoutGuide.trailingAnchor,
                               padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                               size: CGSize(width: 0, height: 40))
    }
}
