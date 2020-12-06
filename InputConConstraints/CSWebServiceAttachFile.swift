//
//  CSWebServiceAttachFile.swift
//  CSWebService
//
//  Created by Kenyi Rodriguez on 5/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit
import PDFKit

public enum CSWebServiceAttachFileType {

    case image
    case pdf
    
    public var information: (extension: String, contentType: String) {
        switch self {
        case .image:
            return (".png", "image/png")
        case .pdf:
            return (".pdf", "application/pdf")
        }
    }
}

public class CSWebServiceAttachFile {
    
    public var attach_file: Any!
    public var attach_type: CSWebServiceAttachFileType!
    public var attach_name: String = ""
    
    public init(file: Any, name: String? = nil, type: CSWebServiceAttachFileType) {
        self.attach_file = file
        self.attach_type = type
        self.attach_name = name ?? self.createRandomName()
    }
    
    public func createRandomName(length: Int = 32) -> String {
        
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let randomString = String(randomCharacters)
        return randomString
    }
    
    public func getDataInformationWithKey(_ key: String) -> Data {
        
        var formData = Data()
        
        if self.attach_type == .image, let image = self.attach_file as? UIImage, let data = image.pngData() {
            formData.append(self.getContentInformationWithFileInData(data, withKey: key))
    
        }else if self.attach_type == .pdf, let pdf = self.attach_file as? PDFDocument, let data = pdf.dataRepresentation() {
            formData.append(self.getContentInformationWithFileInData(data, withKey: key))
            
        }

        return formData
    }
    
    private func getContentInformationWithFileInData(_ fileInData: Data, withKey key: String) -> Data {
        
        var formData = Data()
        
        let fileName = "\(self.attach_name)\(self.attach_type.information.extension)"
        let name = key
        
        formData.append("Content-Disposition:form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        formData.append("Content-Type: \(self.attach_type.information.contentType)\r\n\r\n".data(using: .utf8)!)
        formData.append(fileInData)
        formData.append("\r\n".data(using: .utf8)!)
        
        return formData
    }
}
