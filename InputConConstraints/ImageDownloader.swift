//
//  DownloadImage.swift
//  DescargaDeImagenes
//
//  Created by Kenyi Rodriguez on 11/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

typealias DownloadImage = (_ image: UIImage?, _ urlImage: String) -> Void

extension UIImageView {
    
    func downloadImageInURLString(_ urlString: String, placeHolderImage: UIImage?, success: @escaping DownloadImage) {
    
        self.image = placeHolderImage
        
        guard let urlImage = URL(string: Constants.image_fs + urlString) else {
            print("La url no es válida")
            return
        }
    
        DispatchQueue.global(qos: .default).async {
            
            var imageData: Data!
            
            do {
                imageData = try Data(contentsOf: urlImage)
            }catch {
                print("Se produjo un error")
            }
            
            guard let imageDataSaved = imageData else { return }
            
            let imagenDownloaded = UIImage(data: imageDataSaved)
            
            DispatchQueue.main.async {
                success(imagenDownloaded, urlString)
            }
        }
    }
}
