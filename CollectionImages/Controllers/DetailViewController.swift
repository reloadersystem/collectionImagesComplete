//
//  DetailViewController.swift
//  CollectionImages
//
//  Created by Resembrink Correa on 5/21/20.
//  Copyright © 2020 Reloader. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var texto: UILabel!
    
    var image: UIImage!
    var detalletText: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageView.image = image
        navigationItem.title = "Photo"
        
        texto.text = String(detalletText)
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
