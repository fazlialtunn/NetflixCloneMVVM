//
//  CollectionViewTableViewCell.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 4.04.2024.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"
    var movieArray = [MovieResult]()
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: screenWidth * 0.3, height: screenWidth * 0.45)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    public func configure(movies: [MovieResult]) {
        self.movieArray = movies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}



extension CollectionViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier , for: indexPath) as! MovieCollectionViewCell
        if let model = movieArray[indexPath.row].posterPath {
            print(model)
            cell.configureImageURL(model: model)
        }
        cell.backgroundColor = .systemRed
        return cell
    }
    
}
