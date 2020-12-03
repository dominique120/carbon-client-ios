//
//  PersonBL.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class PersonBL {
    
    class func getPerson( _ success: @escaping Persons) {
        
        PersonWS.getPerson {(arrayPersons) in
            
            //let arraySorted = arrayDisc.sorted(by: { $0.disc_releaseDate > $1.disc_releaseDate })
            success(arrayPersons)
        }
    }
}
