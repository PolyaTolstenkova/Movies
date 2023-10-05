//
//  MainView.swift
//  Movies
//
//  Created by Polina Tolstenkova on 02.10.2023.
//

import UIKit
import SnapKit

class MainView: UIViewController {
    
    private var viewModel: MainViewModel = MainViewModel()
    private var collectionView: UICollectionView?
    private var searchBar: UISearchBar = UISearchBar()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setUpNavigationBar()
        self.setUpSearchBar()
        self.setUpCollectionView()
    }
}

// MARK: - Actions

extension MainView {
    @objc private func sortButtonTapped() {
        self.setUpSortActionSheet()
    }
}

// MARK: - SetUp Methods

extension MainView {
    private func setUpNavigationBar() {
        self.navigationItem.title = "Title"
        self.setUpNavImage()
    }
    
    private func setUpNavImage() {
        let imageView = UIImageView(image: UIImage.sortIcon)
        imageView.contentMode = .scaleAspectFit
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sortButtonTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: imageView)
    }
    
    private func setUpSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundColor = .gray
        
        self.view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }

        searchBar.delegate = self
    }
    
    private func setUpCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 300, height: 200)
      
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView?.backgroundColor = UIColor.white
        if let collectionView = collectionView {
            view.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.top.equalTo(searchBar.snp.bottom).offset(20)
            }
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    private func setUpSortActionSheet() {
        let actionSheet = UIAlertController(title: "Sort Movies", message: "", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Alphabetical", style: .default, handler: { [weak self] _ in
            self?.viewModel.sortAlphabetical()
        })
        let action2 = UIAlertAction(title: "Highest Rated", style: .default, handler: { [weak self] _ in
            self?.viewModel.sortHighestRated()
        })
        let action3 = UIAlertAction(title: "Lowest Rated", style: .default, handler: { [weak self] _ in
            self?.viewModel.sortLowestRated()
        })
        let action4 = UIAlertAction(title: "Oldest to Newest", style: .default, handler: { [weak self] _ in
            self?.viewModel.sortOldestToNewest()
        })
        let action5 = UIAlertAction(title: "Newest to Oldest", style: .default, handler: { [weak self] _ in
            self?.viewModel.sortNewestToOldest()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        actionSheet.addAction(action5)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
     }
}

// MARK: - UISearchBar Methods

extension MainView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - UICollectionView Methods

extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let destinationViewController = MovieView(viewModel: .init(movie: viewModel.mockMovies[indexPath.item]))
            navigationController?.pushViewController(destinationViewController, animated: true)
       }
}

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mockMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = viewModel.mockMovies[indexPath.item]
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        movieCell.set(movie: movie)
        
        return movieCell
    }
}

