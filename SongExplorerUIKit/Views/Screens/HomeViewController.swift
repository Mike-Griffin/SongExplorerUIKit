//
//  HomeViewController.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    let resultsVC: SearchResultsCollectionVC = {
        let layout = UICollectionViewFlowLayout()
        let vc = SearchResultsCollectionVC(collectionViewLayout: layout)
        return vc
    }()

    override func viewDidLoad() {
        configureUI()
        addSubviews()
        configureChildren()
        setupConstraints()
        setupSearchBar()
    }
    
    private func configureUI() {
        // TODO change this to be more dark mode friendly
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(resultsVC.view)
    }
    
    private func configureChildren() {
        addChild(resultsVC)
        resultsVC.didMove(toParent: self)
    }
    
    private func setupConstraints() {
        resultsVC.view.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return }
        MusicManager.shared.search(text) { result in
            switch result {
            case .success(let songs):
                print(songs)
                self.resultsVC.results = songs
                DispatchQueue.main.async {
                    self.resultsVC.collectionView.reloadData()
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    private func setupSearchBar() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search songs"
        navigationItem.searchController = search
        
    }
}
