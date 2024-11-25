//
//  MovieTableViewCell.swift
//  NetflixClone
//
//  Created by Sharmaji on 21/11/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"
    
    private let playMovieButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitle("Play", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0
        button.tintColor = .systemBackground
        button.backgroundColor = .red
        return button
    }()
    
    
    
    private let movieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let movieOverview: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 3
        description.lineBreakMode = .byWordWrapping
        description.font = .systemFont(ofSize: 12)
        return description
    }()
    
    private let moviePosterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(movieLabel)
        contentView.addSubview(playMovieButton)
        contentView.addSubview(movieOverview)
        
        applyConstraints()
    }
    
    
    private func applyConstraints() {
        let moviePosterImageViewConstraints = [
            moviePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            moviePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            moviePosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let movieLabelConstraints = [
            movieLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 20),
            movieLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            movieLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ]
        
        let movieOverviewConstraints = [
            movieOverview.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 20),
            movieOverview.topAnchor.constraint(equalTo: movieLabel.bottomAnchor, constant: 10),
            movieOverview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
        ]
        
        let playMovieButtonConstraints = [
            playMovieButton.topAnchor.constraint(equalTo: movieOverview.bottomAnchor, constant: 20),
            playMovieButton.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 20),
            playMovieButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            playMovieButton.widthAnchor.constraint(equalToConstant: 60),
            playMovieButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(moviePosterImageViewConstraints)
        NSLayoutConstraint.activate(movieLabelConstraints)
        NSLayoutConstraint.activate(movieOverviewConstraints)
        NSLayoutConstraint.activate(playMovieButtonConstraints)
    }
    
    public func configure(with model: MovieViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") else {
            return
        }
        moviePosterImageView.sd_setImage(with: url, completed: nil)
        movieLabel.text = model.movieName
        movieOverview.text = model.movieDescription
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
