//
//  MovieCell.swift
//  Movies
//
//  Created by Polina Tolstenkova on 02.10.2023.
//

import UIKit
import SnapKit

class MovieCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleYearLabel = UILabel()
    let genresLabel = UILabel()
    let ratingLabel = UILabel()
    
    func set(movie: Movie) {
        imageView.image = movie.image
        titleYearLabel.text = "\(movie.title), \(String(movie.year))"
        genresLabel.text = String(movie.genres[0])
        ratingLabel.text = String(movie.rating)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpViews()
    }
    
    private func setUpViews() {
        self.setUpImage()
        self.setUpTitleYear()
        self.setUpGenres()
        self.setUpRating()
    }
    
    private func setUpImage() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(UIScreen.main.bounds.width - 70)
        }
    }
    
    private func setUpTitleYear() {
        titleYearLabel.translatesAutoresizingMaskIntoConstraints = false
        titleYearLabel.font = UIFont.boldSystemFont(ofSize: 22)
        contentView.addSubview(titleYearLabel)
        titleYearLabel.snp.makeConstraints { make in
            make.leading.equalTo(-10)
            make.top.equalTo(18)
        }
    }
    
    private func setUpGenres() {
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        genresLabel.font = UIFont.systemFont(ofSize: 14)
        genresLabel.textColor = .gray
        contentView.addSubview(genresLabel)
        genresLabel.snp.makeConstraints { make in
            make.leading.equalTo(-10)
            make.bottom.equalTo(-15)
        }
    }
    
    private func setUpRating() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.systemFont(ofSize: 14)
        ratingLabel.textColor = .gray
        contentView.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.trailing.equalTo(10)
            make.bottom.equalTo(-15)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
