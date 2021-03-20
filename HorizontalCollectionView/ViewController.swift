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
    
    enum Section {
        case main
    }
    
    private let sectionInset: CGFloat = 16.0
    
    @IBOutlet var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, ImageData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Collection"
        
        let flowLayout = configureLayout()
        collectionView.collectionViewLayout = flowLayout
        
        dataSource = configureDataSource()
        collectionView.dataSource = dataSource
        
        var initialSnapShot = NSDiffableDataSourceSnapshot<Section, ImageData>()
        initialSnapShot.appendSections([.main])
        initialSnapShot.appendItems(data)
        
        dataSource.apply(initialSnapShot, animatingDifferences: false)
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
    
    func configureLayout() -> UICollectionViewLayout {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let itemWidth = CGFloat(200)
        let itemHeight = CGFloat(200 - (sectionInset * 2))
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.estimatedItemSize = .zero
        flowLayout.minimumLineSpacing = 8.0
        flowLayout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        
        return flowLayout
    }
    
    func configureDataSource() -> UICollectionViewDiffableDataSource<Section, ImageData> {
        
        let dataSource = UICollectionViewDiffableDataSource<Section, ImageData>(collectionView: self.collectionView) {
            (collectionView, indexPath, imageData) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
                fatalError("Could not deque cell")
            }
            
            cell.configure(withData: imageData)
            
            return cell
        }
        
        return dataSource
        
    }
}

