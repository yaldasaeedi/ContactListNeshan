//
//  MainModel.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/7/1402 AP.
//
import UIKit

struct UserInformation{
    
    private var name : String
    private var number : Int64
    private var image : UIImage
    private var birthday: Date
    private var note : String
    
    init(name: String, number: Int64, image: UIImage, birthday: Date, note: String) {
        self.name = name
        self.number = number
        self.image = image
        self.birthday = birthday
        self.note = note
    }
}

class UserManeger{
    
    private var userArrey : [UserInformation] = []
    
    func addUser(){
        
        
    }
    func deleteUser(){
        
        
    }
    func editUser(){
        
        
    }
}
