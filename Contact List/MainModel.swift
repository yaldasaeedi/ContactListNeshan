//
//  MainModel.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/7/1402 AP.
//



import UIKit
import UIKit



protocol ContactReader {
    
    func getContactsArray() -> [ContactInformation]
    func getContactsPhone() -> [Int64]
    func getContactsName() -> [String]
}

protocol ContactWriter {
    
    func addContact(newName: String, newNumber: Int64, newEmail: String, newImage: Data, newBirthday: Date, newNote: String)
    func deleteContact(indexPath: IndexPath)
    func editContact(editedContact: ContactInformation, indexPath: IndexPath)
}

class ContactsManager: ContactReader, ContactWriter {
    
    let contactStorage: ContactStorage
    
    init(contactStorage: ContactStorage) {
        
        self.contactStorage = contactStorage
    }
    
    func getContactsArray() -> [ContactInformation] {
        
        return contactStorage.fetchContacts()
    }
    
    func getContactsPhone() -> [Int64] {
        
        return getContactsArray().map { $0.getContactPhone() }
    }
    
    func getContactsName() -> [String] {
        
        return getContactsArray().map { $0.getContactName() }
    }
    
    func addContact(newName: String, newNumber: Int64, newEmail: String, newImage: Data, newBirthday: Date, newNote: String) {
        
        let newContact = ContactInformation(name: newName,
                                            number: newNumber,
                                            email: newEmail,
                                            image: newImage,
                                            birthday: newBirthday,
                                            note: newNote)
        contactStorage.saveContact(newContact)
    }
    
    func deleteContact(indexPath: IndexPath) {
        
        contactStorage.deleteContact(at: indexPath)
    }
    
    func editContact(editedContact: ContactInformation, indexPath: IndexPath) {
        
        contactStorage.editContact(editedContact, at: indexPath)
    }
}
