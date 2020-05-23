//
//  Photo.swift
//  CollectionImages
//
//  Created by Resembrink Correa on 5/20/20.
//  Copyright © 2020 Reloader. All rights reserved.
//

struct PhotoCategory {
    
    var categoryImageName: String
    var title: String
    var descripcion: [String]
    var imageNames: [String]
   
    
   
    func getPhotoCategoryDetail() -> String {
        return ""
    }
    
}

class PhotosLibrary{
    
   
  
    
    class func fetchPhotos() -> [PhotoCategory]
    {
        var categories = [PhotoCategory]()
        let photosData = PhotosLibrary.downloadPhotosData()
        
        // clave , valor
        for (categoryName, dict) in photosData {
            
            if let dict = dict as? [String : Any]{
                let categoryImageName = dict["categoryImageName"] as! String
                
               let detalles = dict["descripcion"] as! [String]
                  
                    if let imageNames = dict["imageNames"] as? [String]{
                        
                        let newCategory = PhotoCategory(categoryImageName: categoryImageName, title: categoryName,
                                                         descripcion: detalles, imageNames: imageNames)
                        
                        categories.append(newCategory)
                    }
               
                
            }
        }
        return categories
    }
    
    
    class func downloadPhotosData() -> [String : Any]{
        
        let desc = ["Matematicas", "Aritmetica","Quimica", "Psicologia", "Capacitacion", "Economia", "Conocimientos"]
        
         let conte = ["Ambiente", "Computacion","Algebra", "Trigonometria", "Geometria", "Sociales", "Historia"]
        
          return [
                   "Family" : [
                       "categoryImageName" : "family",
                       "descripcion" : desc,
                       "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "f", numberOfImages: 7),
                       
                   ],
                   "Foods" : [
                       "categoryImageName" : "foods",
                        "descripcion" : conte,
                       "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "fo", numberOfImages: 7),
                      
                   ],
                   "Travel" : [
                       "categoryImageName" : "travel",
                        "descripcion" : desc,
                       "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "t", numberOfImages: 7),
                      
                   ],
                   "Nature" : [
                       "categoryImageName" : "nature",
                       "descripcion" : desc,
                       "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "n", numberOfImages: 7),
                       
                   ]
               ]
        
    }
    
     class func generateImage(categoryPrefix:String, numberOfImages: Int) -> [String]
    {
        
        var imageNames = [String]()
        
        for i in 1...numberOfImages {
            imageNames.append(("\(categoryPrefix)\(i)"))
        }
        
        return imageNames
    }
    
}
