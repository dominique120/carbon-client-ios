//
//  PersonBL.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class PersonBL {
    
    class func getPerson( _ success: @escaping Persons, personId: String) {
        
        PersonWS.getPerson( {(arrayPersons) in
            
            success(arrayPersons)
        }, personId: personId)
    }
    
    class func getPersonById( _ success: @escaping Persons, personId: String) {
        
        PersonWS.getPersonById( {(arrayPersons) in
            
            success(arrayPersons)
        }, personId: personId)
    }
    
}
