//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Adrian Lesniak on 20/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let sectionInset: CGFloat = 16.0
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let itemWidth = CGFloat(200)
        let itemHeight = CGFloat(200 - (sectionInset * 2))
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.estimatedItemSize = .zero
        flowLayout.minimumLineSpacing = 8.0
        flowLayout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.dataSource = self
        
        navigationItem.title = "Collection"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedItemIndex = collectionView.indexPathsForSelectedItems?.first?.row else {
            return
        }
    
        if segue.identifier == "imagePressed" {
            
            let destinationVc = segue.destination as! ImageViewController
            destinationVc.imageNamed = "square_\(selectedItemIndex + 1)"
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCellCollectionViewCell
        
        cell.configure(withImage: "square_\(indexPath.row + 1)")
        
        return cell
    }
}

