//
//  Closures.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/3/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias User          = (_ objUser: UserBE) -> Void
typealias Person        = (_ objPerson: PersonBE) -> Void
typealias Success       = () -> Void
typealias ErrorMessage  = (_ errorMessage: String) -> Void
