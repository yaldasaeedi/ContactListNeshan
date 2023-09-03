//
//  MainModel.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/7/1402 AP.
//



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


class ContactsManager {
    
    private static var contactsArray : [ContactInformation] = []
    private let userDefaults = UserDefaults.standard
    private let contactsKey = "Contacts"
    
    func syncWithDatabase(){
        
        ContactsManager.contactsArray = fetchContactsFromUserDefaults()
    }
    
    func getContactsArray() -> [ContactInformation] {
        
        return ContactsManager.contactsArray
    }
    
    func getContactsPhone() -> [Int64]{
        
        return ContactsManager.contactsArray.map { $0.getContactPhone() }
    }
    
    func getContactsName() -> [String]{
        
        return ContactsManager.contactsArray.map{ $0.getContactName() }
    }
    
    func addContact(newName : String,
                    newNumber : Int64,
                    newEmail: String,
                    newImage : Data,
                    newBirthday : Date,
                    newNote : String){
        ContactsManager.contactsArray = fetchContactsFromUserDefaults()
        let newContact = ContactInformation(name: newName,
                                            number: newNumber,
                                            email: newEmail,
                                            image: newImage,
                                            birthday: newBirthday,
                                            note: newNote)
            addNewContactToList(new: newContact)
    }
    private func addNewContactToList(new : ContactInformation){
        
        saveContactToUserDefaults(new)
        syncWithDatabase()
    }
    
    func deleteContact(indexPath : IndexPath){
        
        deleteContactFromUserDefaults(at: indexPath)
        syncWithDatabase()
        
    }
    
    func editContact(editedContact : ContactInformation, indexPath : IndexPath){

        editContactInUserDefaults(editedContact, at : indexPath)
        syncWithDatabase()

    }
    
    private func saveContactToUserDefaults(_ contact: ContactInformation) {
        
        ContactsManager.contactsArray.append(contact)
        
        do {
            
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(ContactsManager.contactsArray)
            userDefaults.set(encodedData, forKey: contactsKey)
        } catch {
            
            print("Error occurred while encoding data: \(error)")
        }
    }

    private func fetchContactsFromUserDefaults() -> [ContactInformation] {
        
        guard let encodedData = userDefaults.data(forKey: contactsKey) else {
            
            return []
        }
        
        do {
            
            let decoder = JSONDecoder()
            let savedContacts = try decoder.decode([ContactInformation].self, from: encodedData)
            
            return savedContacts
        } catch {
            
            print("Error occurred while decoding data: \(error)")
            
            return []
        }
    
    }
    
    private func deleteContactFromUserDefaults(at indexPath: IndexPath) {
        
        var savedContacts = fetchContactsFromUserDefaults()
        savedContacts.remove(at: indexPath.row)
        
        do {
            
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(savedContacts)
            userDefaults.set(encodedData, forKey: contactsKey)
        } catch {
            
            print("Error occurred while encoding data: \(error)")
        }
    }
    private func editContactInUserDefaults(_ updatedContact: ContactInformation, at indexPath: IndexPath) {
        var savedContacts = fetchContactsFromUserDefaults()
        savedContacts[indexPath.row] = updatedContact
        
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(savedContacts)
            userDefaults.set(encodedData, forKey: contactsKey)
        } catch {
            print("Error occurred while encoding data: \(error)")
        }
    }
}
