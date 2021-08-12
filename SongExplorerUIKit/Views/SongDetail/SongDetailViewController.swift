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
    }
    
    func addSubviews() {
        view.addSubview(label)
    }
    
    func configureConstraints() {
        label.anchorCenter(centerX: view.safeAreaLayoutGuide.centerXAnchor,
                           centerY: view.safeAreaLayoutGuide.centerYAnchor)
    }
}
