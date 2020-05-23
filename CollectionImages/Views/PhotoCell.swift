//
//  PhotoCell.swift
//  CollectionImages
//
//  Created by Resembrink Correa on 5/20/20.
//  Copyright © 2020 Reloader. All rights reserved.
//

import UIKit

class PhotoCell : UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
   @IBOutlet weak var txtDetalle: UILabel!
    
    var imageName: String!
  var detalles: String!
    {
        
        didSet{
            
            photoImageView.image = UIImage(named: imageName)
      txtDetalle.text = detalles
        }
    }
    
}
