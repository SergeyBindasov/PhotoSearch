//
//  GalleryCell.swift
//  Photo Search
//
//  Created by Sergey on 26.02.2021.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryCell {
    
    func configure(with urlSting: String){
        guard let url = URL(string: urlSting) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.photo.image = image
            }
        }
        task.resume()
    }
    
    func setupLayout() {
        contentView.addSubviewWithAutoLayout(photo)
        
        
        let constraints = [
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

