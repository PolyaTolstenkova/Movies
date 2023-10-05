//
//  MovieView.swift
//  Movies
//
//  Created by Polina Tolstenkova on 04.10.2023.
//

import UIKit
import SnapKit

class MovieView: UIViewController {
    
    var viewModel: MovieViewModel
    
    let imageView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let countryYearLabel: UILabel = UILabel()
    let genresLabel: UILabel = UILabel()
    let trailerView: UIImageView = UIImageView()
    let ratingLabel: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setUpNavigationBar()
        self.setUpViews()
    }
    
    private func setUpNavigationBar() {
        self.navigationItem.title = viewModel.movie.title

        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    private func setUpViews() {
        self.setUpImage()
        self.setUpTitle()
        self.setUpCountryYear()
        self.setUpGenresLabel()
        self.setUpTrailerView()
        self.setUpRatingLabel()
        self.setUpDescriptionLabel()
    }
    
    private func setUpImage() {
        imageView.image = viewModel.movie.image
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(UIScreen.main.bounds.width - 40)
        }
    }
    
    private func setUpTitle() {
        titleLabel.text = viewModel.movie.title
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .appGray
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.top.equalTo(imageView.snp.bottom).offset(15)
        }
    }
    
    private func setUpCountryYear() {
        countryYearLabel.text = "\(viewModel.movie.country), \(String(viewModel.movie.year))"
        countryYearLabel.font = UIFont.systemFont(ofSize: 20)
        countryYearLabel.textColor = .appGray
        self.view.addSubview(countryYearLabel)
        countryYearLabel.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
    }
    
    private func setUpGenresLabel() {
        genresLabel.text = viewModel.movie.genres[0]
        genresLabel.font = UIFont.systemFont(ofSize: 20)
        genresLabel.textColor = .appGray
        self.view.addSubview(genresLabel)
        genresLabel.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.top.equalTo(countryYearLabel.snp.bottom).offset(15)
        }
    }
    
    private func setUpTrailerView() {
        trailerView.image = UIImage.trailerIcon
        view.addSubview(trailerView)
        trailerView.snp.makeConstraints { make in
            make.top.equalTo(genresLabel.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(trailerButtonTapped))
        trailerView.isUserInteractionEnabled = true
        trailerView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setUpRatingLabel() {
        ratingLabel.text = "Rating: \(String(viewModel.movie.rating))"
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 16)
        ratingLabel.textColor = .appDarkGray
        self.view.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-15)
            make.top.equalTo(genresLabel.snp.bottom).offset(15)
        }
    }
    
    private func setUpDescriptionLabel() {
        descriptionLabel.text = viewModel.movie.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .appLightGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        self.view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.top.equalTo(ratingLabel.snp.bottom).offset(25)
            make.width.equalTo(UIScreen.main.bounds.width - 25)
        }
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func trailerButtonTapped() {
        print("Trailer tapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
