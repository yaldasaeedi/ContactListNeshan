//
//  ViewControllerForAddUser.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/7/1402 AP.
//

import UIKit


class ViewControllerForAddUser: UIViewController {

    weak var delegate: ViewControllerForAddUserDelegate?
    
    @IBOutlet weak var userImageIV: UIImageView!
    @IBOutlet weak var contactNameTF: UITextField!
    @IBOutlet weak var contactNumderTF: UITextField!
    @IBOutlet weak var contactEmailTF: UITextField!
    @IBOutlet weak var contactBirthdayDP: UIDatePicker!
    @IBOutlet weak var contactNoteTF: UITextField!
    
    private var newUser : UserInformation?
    private var newName : String?
    private var newNumber : Int64?
    private var newEmail : String?
    private var newImage : UIImage?
    private var newBirthday: Date?
    private var newNote : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageIV.image = UIImage(named: "image")
        newImage = userImageIV.image
        
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
        
        newName = contactNameTF.text
    }
    
    @IBAction func addingContactNumber(_ sender: Any) {
        
        newNumber = Int64(contactNumderTF.text!)
    }
    
    @IBAction func addingContactEmail(_ sender: Any) {
        
        newEmail = contactEmailTF.text
    }
    
    @IBAction func addingContactBirthdat(_ sender: Any){
        
        newBirthday = contactBirthdayDP.date
    }
    
    @IBAction func addingContactNote(_ sender: Any) {
        
        newNote = contactNoteTF.text
    }
    
    @IBAction func contactInfoAdded(_ sender: Any) {
        guard let NewUser = newUser else {
                    print("Error: newUser is nil")
                    return
        }
//        newUser?.addContact(newName: newName ?? "no name",
//                            newNumber: newNumber ?? 0 ,
//                            newEmail: newEmail ?? "no email",
//                            newImage: newImage!,
//                            newBirthday: newBirthday!,
//                            newNote: newNote ?? "no note")
        delegate?.didAddNewContact(self, didFinish: newUser!)
    }
    
    
}

