//
//  ImageViewController.swift
//  HorizontalCollectionView
//
//  Created by Adrian Lesniak on 20/03/2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var imageNamed: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageNamed)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

}
