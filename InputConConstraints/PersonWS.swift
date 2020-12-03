//
//  PersonWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation


typealias Persons = (_ arrayPersons: [Person]) -> Void

class PersonWS {
    
    class func getPerson(_ success: @escaping Persons, personId: String) {
        
        WebServiceManager.doRequest(.get, urlString: Constants.api_base_url + "/personbyuser?id=" + personId, wait: true) { (responseService) in
            
            let json = responseService as? [JSON] ?? []
            //let products = json["productos"] as? JSON ?? [:]
            //let discsWS = products["discos"] as? [JSON] ?? []
            
            var arrayPersons = [Person]()
            
            for element in json {
                let obj = Person(json: element)
                arrayPersons.append(obj)
            }
            success(arrayPersons)
        }
    }
}
