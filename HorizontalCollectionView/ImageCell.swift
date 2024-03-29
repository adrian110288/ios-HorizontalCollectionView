//
//  CustomCellCollectionViewCell.swift
//  HorizontalCollectionView
//
//  Created by Adrian Lesniak on 20/03/2021.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static public let identifier = String(describing: ImageCell.self)
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        
        clipsToBounds = true
        
        contentView.layer.cornerRadius = 2.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
    }
    
    func configure(withData data: ImageData) {
        imageView.image = UIImage(named: data.name)
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
}
