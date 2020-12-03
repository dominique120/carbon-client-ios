//
//  WebServiceManager.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 23/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

extension WebServiceManager {
    
    typealias JSON      = [String: Any]
    typealias Response  = (_ jsonResponse: Any?) -> Void
    typealias Request   = (_ jsonRequest: Any?) -> Void
    
    enum HTTPMethod: String {
        
        case get    = "GET"
        case post   = "POST"
        case put    = "PUT"
        case delete = "DELETE"
    }
}


class WebServiceManager {
    
    class func doRequestWithMethod(_ httpMethod: HTTPMethod, urlString: String, requestBody: Request?, response: @escaping Response) {
        
        let urlStringWithFormat = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""
        
        guard let url = URL(string: urlStringWithFormat) else {
            print("Error en la URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        do{
            try request.httpBody = JSONSerialization.data(withJSONObject: requestBody ?? "", options: .prettyPrinted)
        } catch {}
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        let session = URLSession(configuration: sessionConfiguration)
        
        let dataTask = session.dataTask(with: request) { (data, urlResponse, error) in
            
            DispatchQueue.global(qos: .background).async {
                
                var jsonResponse: Any?
                
                do {
                    jsonResponse = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
                    
                }catch {
                    print("Error al intentar leer el JSON")
                }
                
                DispatchQueue.main.async {
                    print(jsonResponse ?? "SIN RESPUESTA")
                    response(jsonResponse)
                }
            }
        }
        
        dataTask.resume()
    }
}
