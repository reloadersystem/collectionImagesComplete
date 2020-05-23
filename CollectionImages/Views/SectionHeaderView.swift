//
//  SectionHeaderView.swift
//  CollectionImages
//
//  Created by Resembrink Correa on 5/20/20.
//  Copyright © 2020 Reloader. All rights reserved.
//

import UIKit

class SectionHeaderView : UICollectionReusableView{
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    var photoCategory: PhotoCategory!
    
    {
        
        didSet{
            categoryTitleLabel.text = photoCategory.title
            
            categoryImageView.image = UIImage(named: photoCategory.categoryImageName)
        }
    }
}
