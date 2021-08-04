//
//  ViewController.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/3/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        MusicManager.shared.search("kid cudi") { result in
            switch result {
            case .success(let searchResult):
                print("success")
                for song in searchResult.response.hits {
                    print(song.result.title)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
    }


}

