//
//  ImageDownloaded.swift
//  DescargaDeImagenes
//
//  Created by Kenyi Rodriguez on 11/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

extension UIImageView {
    
    typealias DownloadSuccess = (_ image: UIImage?, _ urlString: String) -> Void
    
    func downloadImageInUrlString(_ urlString: String, success: @escaping DownloadSuccess) {
        
        guard let url = URL(string: urlString) else {
            print("URL INVÁLIDA")
            return
        }
        
        var imageDownloaded: UIImage?
        
        DispatchQueue.global(qos: .default).async {
            
            do {
                let dataImage = try Data(contentsOf: url)
                imageDownloaded = UIImage(data: dataImage)
            }catch {
                print("Error al descargar la imagen")
            }
            
            DispatchQueue.main.async {
                success(imageDownloaded, urlString)
            }
        }
    }
}
