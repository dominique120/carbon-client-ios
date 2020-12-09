//
//  ImageWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class ImageWS {
    class func sendIamge(imageId: String, image: UIImage, _ success: @escaping Success, error: @escaping ErrorMessage) {
        
        let header = CSWebServiceHeaderRequest()
        header.contentType = .formData
        
        let parametros: [String: Any] = ["imgId"       : imageId,                                        
                                         "postImg"   : CSWebServiceAttachFile(file: image, type: .image)]
        
        CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.uploadImage, header: header, parameters: parametros) { (response) in
            
            if response.errorCode == 200 {
                success()
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
}
