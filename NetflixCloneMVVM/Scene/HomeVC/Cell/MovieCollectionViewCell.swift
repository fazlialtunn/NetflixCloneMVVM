//
//  MovieCollectionViewCell.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 4.04.2024.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configureImageURL(model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {
            return
        }
        URLSession.shared.dataTask(with: url) {[weak self] data, _, _ in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                print(data)
                self?.posterImageView.image = UIImage(data: data)
            }
        }
        .resume()
    }
}
