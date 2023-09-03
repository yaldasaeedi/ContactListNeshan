//
//  ViewControllerForAddContact.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/7/1402 AP.
//

import UIKit

enum ContactViewMode {
    case viewAddEdit
    case add
}

protocol ContactScreenDelegate: AnyObject {
    
    var contactViewMode: ContactViewMode { get set }
}

class ViewControllerForAddContact: UIViewController {

    
    @IBOutlet weak var contactImageIV: UIImageView!
    @IBOutlet weak var contactNameTF: UITextField!
    @IBOutlet weak var contactNumderTF: UITextField!
    @IBOutlet weak var contactEmailTF: UITextField!
    @IBOutlet weak var contactBirthdayDP: UIDatePicker!
    @IBOutlet weak var contactNoteTF: UITextField!
    
    var contactsModel = ContactsManager()
    var contact : ContactInformation?
    var contactIndexPath : IndexPath?
    var contactViewMode: ContactViewMode = .add

    private var newName : String?
    private var newNumber : Int64?
    private var newEmail : String?
    private var newImage : UIImage?
    private var newBirthday: Date?
    private var newNote : String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if contactViewMode == .viewAddEdit{
            isEditing()
        }
    }
    
    @IBAction func addingContactPhoto(_ sender: Any) {
        if contactViewMode == .viewAddEdit{
            isEditing()
        }else{
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func addingContactName(_ sender: Any) {
        
        guard let unwrappedName = contactNameTF.text else{
            
            print("nill name")
            return
        }
        newName = unwrappedName
    }
    
    @IBAction func addingContactNumber(_ sender: Any) {
        
        guard let unwrappedNumber = Int64(contactNumderTF.text!) else{
            
            print("nill number")
            return
        }
        newNumber = unwrappedNumber
    }
    
    @IBAction func addingContactEmail(_ sender: Any) {
        
        guard let unwrappedEmail = contactEmailTF.text else{
            
            print("nill email")
            return
        }
        newEmail = unwrappedEmail
    }
    
    @IBAction func addingContactBirthdat(_ sender: UIDatePicker){

        newBirthday = sender.date
    }
    
    @IBAction func addingContactNote(_ sender: Any) {
        
        guard let unwrappedNote = contactNoteTF.text else{
            
            print("nill Note")
            return
        }
        newNote = unwrappedNote
    }
    
    @IBAction func contactInfoAdded(_ sender: Any) {
        if contactViewMode == .viewAddEdit{
            
            contactsModel.editContact(indexPath: contactIndexPath!)
        }else{
            setDefaultImageAndDate()
            contactsModel.addContact(newName: newName ?? "no name",
                                     newNumber: newNumber ?? 0 ,
                                     newEmail: newEmail ?? "no email",
                                     newImage: (newImage?.jpegData(compressionQuality: 0.8))!,
                                     newBirthday: newBirthday!,
                                     newNote: newNote ?? "no note")
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func setDefaultImageAndDate(){
        
        contactImageIV.image = UIImage(named: "Image")
        newImage = contactImageIV.image!
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 1990
        dateComponents.month = 1
        dateComponents.day = 1
        newBirthday = calendar.date(from: dateComponents)
        
        contactBirthdayDP.date = newBirthday ?? Date()
    }
    
    private func isEditing(){
        
        contactImageIV.image = UIImage(data : (contact?.getContactImage())!)
        contactNameTF.text = contact?.getContactName()
        contactNumderTF.text = contact?.getContactPhone().description
        contactEmailTF.text = contact?.getContactEmail()
        contactBirthdayDP.date = (contact?.getContactBirthday())!
        contactNoteTF.text = contact?.getContactNote()
        
        newImage = contactImageIV.image
        newName = contactNameTF.text
        newNumber = Int64(contactNumderTF.text!)
        newEmail = contactEmailTF.text
        newBirthday = contactBirthdayDP.date
        newNote = contactNoteTF.text

    }
}
    
extension ViewControllerForAddContact : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
            if let pickedImage = info[.originalImage] as? UIImage {
                
                contactImageIV.image = pickedImage
                newImage = pickedImage
                
            }else{
                
                print("image is nill")
            }

        dismiss(animated: true, completion: nil)
    }
}

