//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Adrian Lesniak on 20/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let data = [
        ImageData(name: "square_1"),
        ImageData(name: "square_2"),
        ImageData(name: "square_3"),
        ImageData(name: "square_4"),
        ImageData(name: "square_5"),
        ImageData(name: "square_6"),
        ImageData(name: "square_7"),
        ImageData(name: "square_8"),
        ImageData(name: "square_9"),
        ImageData(name: "square_10"),
        ImageData(name: "square_11"),
        ImageData(name: "square_12")
    ]
    
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
            destinationVc.imageData = data[selectedItemIndex]
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        
        let imageData = data[indexPath.row]
        
        cell.configure(withData: imageData)
        
        return cell
    }
}

