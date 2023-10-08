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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints({ make in
            make.bottom.equalToSuperview()
           make.top.equalTo(150)
           make.leading.equalTo(15)
           make.trailing.equalTo(-15)
        })
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delaysContentTouches = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        view.insertSubview(searchBar, aboveSubview: collectionView)
        searchBar.snp.makeConstraints({ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
        })

        searchBar.isTranslucent = false
        searchBar.placeholder = "Search"
        searchBar.backgroundImage = UIImage()

        searchBar.delegate = self

        return searchBar
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setUpNavigationBar()
        searchBar.isHidden = false
        collectionView.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        searchBar.resignFirstResponder()
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

extension MainView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationViewController = MovieView(viewModel: .init(movie: viewModel.mockMovies[indexPath.item]))
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mockMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = viewModel.mockMovies[indexPath.item]
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        movieCell.set(movie: movie)
        
        return movieCell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.width - 150)
    }
    
    func collectionView(
          _ collectionView: UICollectionView,
          layout collectionViewLayout: UICollectionViewLayout,
          minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
          return 15
      }
}
