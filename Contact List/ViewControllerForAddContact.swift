//
//  ViewControllerForAddContact.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/7/1402 AP.
//

import UIKit


class ViewControllerForAddContact: UIViewController {

    weak var delegate: ViewControllerForAddContactDelegate?
    
    @IBOutlet weak var contactImageIV: UIImageView!
    @IBOutlet weak var contactNameTF: UITextField!
    @IBOutlet weak var contactNumderTF: UITextField!
    @IBOutlet weak var contactEmailTF: UITextField!
    @IBOutlet weak var contactBirthdayDP: UIDatePicker!
    @IBOutlet weak var contactNoteTF: UITextField!
    
    private var newContact : ContactInformation?
    private var newName : String?
    private var newNumber : Int64?
    private var newEmail : String?
    private var newImage : UIImage?
    private var newBirthday: Date?
    private var newNote : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactImageIV.image = UIImage(named: "image")
        newContact?.image = contactImageIV.image!
        
        // Set a default birthday to a specific date
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 1990
        dateComponents.month = 1
        dateComponents.day = 1
        newBirthday = calendar.date(from: dateComponents)
        
        // Set the default date on the date picker
        contactBirthdayDP.date = newBirthday ?? Date()
    }
    
    @IBAction func addingContactName(_ sender: Any) {
        
        newContact?.name = contactNameTF.text!
    }
    
    @IBAction func addingContactNumber(_ sender: Any) {
        
        newContact?.number = Int64(contactNumderTF.text!)!
    }
    
    @IBAction func addingContactEmail(_ sender: Any) {
        
        newContact?.email = contactEmailTF.text!
    }
    
    @IBAction func addingContactBirthdat(_ sender: Any){
        
        newContact?.birthday = contactBirthdayDP.date
    }
    
    @IBAction func addingContactNote(_ sender: Any) {
        
        newContact?.note = contactNoteTF.text!
    }
    
    @IBAction func contactInfoAdded(_ sender: Any) {
        guard let unwrappedNewContact = newContact else {
                    print("Error: newContact is nil")
                    return
        }
//        newContact?.addContact(newName: newName ?? "no name",
//                            newNumber: newNumber ?? 0 ,
//                            newEmail: newEmail ?? "no email",
//                            newImage: newImage!,
//                            newBirthday: newBirthday!,
//                            newNote: newNote ?? "no note")
        delegate?.didAddNewContact(self, didFinish: unwrappedNewContact)
    }
    
    
}

