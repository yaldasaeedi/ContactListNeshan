//
//  ViewControllerForAddUser.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/7/1402 AP.
//

import UIKit

class ViewControllerForAddUser: UIViewController {

    @IBOutlet weak var userImageIV: UIImageView!
    @IBOutlet weak var contactNameTF: UITextField!
    @IBOutlet weak var contactNumderTF: UITextField!
    @IBOutlet weak var contactEmailTF: UITextField!
    @IBOutlet weak var contactBirthdayDP: UIDatePicker!
    @IBOutlet weak var contactNoteTF: UITextField!
    
    private var newUser : UserInformation? //todo : do it like what hoorad saied
    private var newName : String?
    private var newNumber : Int64?
    private var newEmail : String?
    private var newImage : UIImage?
    private var newBirthday: Date?
    private var newNote : String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
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
        
        newUser = UserInformation(name: newName! , number: newNumber! , email: newEmail!, image: newImage! , birthday: newBirthday!, note: newNote!)
    }
    
    
}
