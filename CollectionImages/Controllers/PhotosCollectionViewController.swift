//
//  PhotosCollectionViewController.swift
//  CollectionImages
//
//  Created by Resembrink Correa on 5/20/20.
//  Copyright © 2020 Reloader. All rights reserved.
//


import UIKit


class PhotosCollectionViewController : UICollectionViewController{
   
    var photoCategories: [PhotoCategory] = PhotosLibrary.fetchPhotos()
    
    
    // MARK: View Controller Lifecycle
    
    struct Storyboard {
        
        static let photoCell = "PhotoCell"
        
        static let sectionHeaderView = "SectionHeaderView"
        
        static let showDetailVC = "ShowImageDetail"
        
        static let leftAndRightPadding: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0 // imagenes por fila
    }
    
    override func viewDidLoad() {
        //
        
        let collectionViewWidth = collectionView?.frame.width
        
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPadding) / Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    
    //MARK - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCategories[section].imageNames.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.photoCell, for: indexPath) as! PhotoCell
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        let imageName = imageNames[indexPath.item]
        
        cell.imageName = imageName
        
        cell.detalles = photoCategory.descripcion[indexPath.item]
        
        return cell
    }
    

// Section HeaderView
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeaderView, for: indexPath) as! SectionHeaderView
        
        let category = photoCategories[indexPath.section]
        
        sectionHeaderView.photoCategory = category
        
    
        return sectionHeaderView
        
  
        
    }
    
    
    // MARK:  UICollectionViewDelegate
    
    var selectedImage: UIImage!
    var selectedTexto: String!
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let category = photoCategories[indexPath.section]
        
        selectedImage = UIImage(named: category.imageNames[indexPath.item])
        selectedTexto = category.descripcion[indexPath.item]
        
        performSegue(withIdentifier: Storyboard.showDetailVC, sender: nil)
      
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == Storyboard.showDetailVC {
            
            let detailVC = segue.destination as! DetailViewController
            detailVC.image = selectedImage
            detailVC.detalletText = selectedTexto
            
        }
    }
    
    
}



