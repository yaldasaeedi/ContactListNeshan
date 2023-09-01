//
//  MainModel.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/7/1402 AP.
//
import UIKit

struct UserInformation{
    
    var name : String
    var number : Int64
    var email : String
    var image : UIImage
    var birthday: Date
    var note : String
    
    init(name: String, number: Int64,email : String, image: UIImage, birthday: Date, note: String) {
        self.name = name
        self.number = number
        self.email = email
        self.image = image
        self.birthday = birthday
        self.note = note
    }
}

class UserManeger{
    
    var ContactsArrey : [UserInformation] = []
    
    func getContactsArrey() -> [UserInformation] {
        return self.ContactsArrey
    }
    
    func getContactsPhone() -> [Int64]{
        return ContactsArrey.map { $0.number }
        
    }
    
    func getContactsName() -> [String]{
        return ContactsArrey.map{ $0.name }
    }
    
    func addContact(newName : String, newNumber : Int64, newEmail: String, newImage : UIImage, newBirthday : Date, newNote : String){
        var newContact = UserInformation(name: newName, number: newNumber, email: newEmail, image: newImage, birthday: newBirthday, note: newNote)
        ContactsArrey.append(newContact)
        
    }
    func addNewContact(new : UserInformation){
        
        ContactsArrey.append(new)
        
    }
    func deleteUser(){
        
        
    }
    func editUser(){
        
        
    }
}
