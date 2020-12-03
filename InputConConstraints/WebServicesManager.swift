//
//  WebServiceManager.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 26/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation



extension WebServiceManager {
    
    typealias Response = (_ response: Any?) -> Void
    typealias JSON = [String : Any]
    
    enum Method: String {
        case get    = "GET"
        case post   = "POST"
        case put    = "PUT"
        case delete = "DELETE"
    }
}

class WebServiceManager {
    
    class func getDataRequest(_ params: JSON) -> Data? {
        
        do {
            let dataParams = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            return dataParams
            
        }catch {
            return nil
        }
    }
    
    
    class func doRequest(_ method: Method = .get, urlString: String, bodyParams: JSON? = nil, wait: Bool? = false, success: @escaping Response) {
        
            let sem = DispatchSemaphore(value: 0)
        
        
        let urlStringFormat = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""
        
        guard let url = URL(string: urlStringFormat) else {
            print("Error en la URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let params = bodyParams {
            request.httpBody = self.getDataRequest(params)
        }
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Content-Type" : "application/json",
                                                      "os" : "ios"]
        
        
        let session = URLSession(configuration: sessionConfiguration)
        
        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            
            DispatchQueue.global(qos: .background).async {
                
                var response: Any?
                
                do {
                    response = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
                }catch {
                    print("Error al intenter leer el JSON")
                }
                
                DispatchQueue.main.async {
                    success(response)
                }
                if wait ?? false {
                    sem.signal()
                }
            }
            
        }
        
        task.resume()
        if wait ?? false {
            sem.wait()
        }
    }
}
