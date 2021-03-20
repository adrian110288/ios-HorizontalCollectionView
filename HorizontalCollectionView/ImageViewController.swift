//
//  ImageViewController.swift
//  HorizontalCollectionView
//
//  Created by Adrian Lesniak on 20/03/2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var imageData: ImageData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        guard let imageData = imageData else { return }
        
        imageView.image = UIImage(named: imageData.name)
        
        
    }

}
