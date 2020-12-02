//
//  WebService.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation


func basicGet(url: String) -> [[String: Any]] {
    var json_response: [[String: Any]] = [[:]]
    let sem = DispatchSemaphore(value: 0)
    
    var request = URLRequest(url: URL(string: Constants.api_base_url + url)!)
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
        //print(response!)
        
        //let string = String(data: request.httpBody!, encoding: .utf8)
        //print(string!)
        
        if let httpResponse = response as? HTTPURLResponse {
            print(httpResponse.statusCode)
              let string = String(data: data!, encoding: .utf8)
             print(string!)
        }
        
         do {
            //json_response = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
            json_response = try (JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]])!
         //print(json)
         } catch {
         print("error")
         }
        sem.signal()
    })
    
    task.resume()
    sem.wait()
    return json_response
}



func basicGetStringBody(url: String) -> String {
    let sem = DispatchSemaphore(value: 0)
    var request = URLRequest(url: URL(string: Constants.api_base_url + url)!)
    request.httpMethod = "GET"
    var string_response = ""
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
        //print(response!)
        
        //let string = String(data: request.httpBody!, encoding: .utf8)
        //print(string!)
        
        if let httpResponse = response as? HTTPURLResponse {
            //print(httpResponse.statusCode)
            string_response = String(data: data!, encoding: .utf8) ?? ""
            //print(string_response)
        }
        /*
         do {
            //json_response = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
            json_response = try (JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]])!
         //print(json)
         } catch {
         print("error")
         }
         */
        sem.signal()
    })
    
    task.resume()
    sem.wait()
    print(string_response)
    return string_response
}



func basicPostWithNoBody(url: String) -> Void{
    var request = URLRequest(url: URL(string: Constants.api_base_url + url)!)
    request.httpMethod = "POST"
    
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
        
        if let httpResponse = response as? HTTPURLResponse {
            print(httpResponse.statusCode)
        }
    })
    task.resume()
}



func basicPostWithBody(url: String, dictionary: [[String: Any]]) -> Void {
      
    var request = URLRequest(url: URL(string: Constants.api_base_url + url)!)
    request.httpMethod = "POST"
    
    
    var jsonData: Data = ("".data(using: .utf8)?.base64EncodedData())!
    do {
        jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        // here "jsonData" is the dictionary encoded in JSON data

    } catch {
        print(error.localizedDescription)
    }
        
    request.httpBody = jsonData
    
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
        //print(response!)
        /*
        let string = String(data: request.httpBody!, encoding: .utf8)
        print(string!)
        
        if let httpResponse = response as? HTTPURLResponse {
            print(httpResponse.statusCode)
              let string = String(data: data!, encoding: .utf8)
             print(string!)
        }
       */
    })
    task.resume()
   
}
