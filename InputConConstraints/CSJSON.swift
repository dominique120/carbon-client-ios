//
//  CSJSON.swift
//  CSWebService
//
//  Created by Kenyi Rodriguez on 1/20/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

fileprivate enum CSTypeJson {
    case array
    case dictionary
    case number
    case string
    case null
}

public class CSJSON{
    
    fileprivate var type            : CSTypeJson = .null
    fileprivate var jsonArray       = [Any]()
    fileprivate var jsonDictinary   = [String : Any]()
    fileprivate var jsonString      = ""
    fileprivate var jsonNumber      : NSNumber = 0
    fileprivate var jsonNull        = NSNull()
    
    fileprivate var object : Any?{
        get{
            return self.getValueObject()
        }
        set{
            self.setNewValueObject(newValue)
        }
    }

    public init(_ newObject: Any?) {
        self.object = newObject
    }
    
    fileprivate func getValueObject() -> Any{
        switch self.type {
        case .array:
            return self.jsonArray
        case .dictionary:
            return self.jsonDictinary
        case .string:
            return self.jsonString
        case .number:
            return self.jsonNumber
        default:
            return self.jsonNull
        }
    }
    
    fileprivate func setNewValueObject(_ newValue: Any?){
        
        if newValue is NSNumber{
            self.type = .number
            self.jsonNumber = newValue as! NSNumber
            
        }else if newValue is String{
            self.type = .string
            self.jsonString = newValue as! String
            
        }else if newValue is [String : Any] {
            self.type = .dictionary
            self.jsonDictinary = newValue as! [String : Any]
            
        }else if newValue is [Any] {
            self.type = .array
            self.jsonArray = newValue as! [Any]
            
        }else {
            self.type = .null
        }
    }
    
    public var value: Any {
        return self.getValueObject()
    }
    
    public var dictionary: [String : CSJSON]{
        var newDic = [String: CSJSON]()
        
        for dic in self.jsonDictinary{
            newDic[dic.key] = CSJSON(dic.value)
        }
        
        return newDic
    }
    
    public var array: [CSJSON]{
        return self.jsonArray.map { CSJSON($0) }
    }
    
    public var dictionaryValue: [String: Any]?{
        get{
            return self.type != .dictionary ? nil : self.jsonDictinary
        }
    }
    
    public var arrayValue: [Any]?{
        get{
            return self.type != .array ? nil : self.jsonArray
        }
    }
    
    public var intValue: Int?{
        get{
            return self.type != .number ? nil : self.jsonNumber.intValue
        }
    }
    
    public var doubleValue: Double?{
        get{
            return self.type != .number ? nil : self.jsonNumber.doubleValue
        }
    }
    
    public var floatValue: Float?{
        get{
            return self.type != .number ? nil : self.jsonNumber.floatValue
        }
    }
    
    public var boolValue: Bool?{
        get{
            return self.type != .number ? nil : self.jsonNumber.boolValue
        }
    }
    
    public var stringValue: String?{
        get{
            return self.type != .string ? nil : self.jsonString
        }
    }

}
