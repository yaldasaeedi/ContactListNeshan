//
//  ContactInformation.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/13/1402 AP.
//

import Foundation
import UIKit

struct ContactInformation : Decodable, Encodable{
    
    private var name : String
    private var number : Int64
    private var email : String
    private var image : Data
    private var birthday: Date
    private var note : String
    
    init(name: String, number: Int64,email : String, image: Data, birthday: Date, note: String) {

        self.name = name
        self.number = number
        self.email = email
        self.image = image
        self.birthday = birthday
        self.note = note
    }
    
    func getContactPhone() -> Int64{
        
        return number
        
    }
    
    func getContactName() -> String{
        
        return name
    }
    
    func getContactImage() -> Data{
        
        return image
    }
    
    func getContactEmail() -> String{
        
        return email
        
    }
    
    func getContactBirthday() -> Date{
        
        return birthday
    }
    
    func getContactNote() -> String{
        
        return note
    }
}
