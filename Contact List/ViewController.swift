//
//  ViewController.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/6/1402 AP.


import UIKit

class ViewController: UIViewController, ViewControllerForAddContactDelegate {
    
    @IBOutlet weak var searchForContactSB: UISearchBar!
    @IBOutlet weak var contactTableTV: UITableView!
    
   // private var contactsList: [ContactInformation] = ContactsManeger().ContactsArrey
   private var contactsList : [ContactInformation] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        contactsList = ContactsManeger().ContactsArrey

        contactTableTV.delegate = self
        contactTableTV.dataSource = self
        
        contactTableTV.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        
        // initializeAContact function is a temp function just for testing my table view
        func initializeAContact(){
            
            let calendar = Calendar.current
            var currentDate: Date?
            
            currentDate = Date()
            
            if let currentDate = currentDate {
                
                let components = calendar.dateComponents([.year, .month, .day], from:currentDate)
                
                if let dateWithoutTime = calendar.date(from: components) {
                                        
                    let imageName = "image"
                    let image = UIImage(named: imageName)

                    guard let image = image else {
                        
                        print("Error: Image named '\(imageName)' not found")
                        return
                    }
                        let tempContact = ContactInformation(
                            name: "yalda",
                            number: 09155804702,
                            email: "yalda.saeedi1381@gmail.com",
                            image: image,
                            birthday: dateWithoutTime,
                            note: "its myself"
                        )
                    contactsList.append(tempContact)
                }
            }
        }
        initializeAContact()
        contactTableTV.reloadData()
    }
    
    
}

protocol ViewControllerForAddContactDelegate: AnyObject {
    
    func didAddNewContact(_ controller: ViewControllerForAddContact, didFinish newContact : ContactInformation)
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contactsList[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = String(contact.number)
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Perform the deletion logic
            contactsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

      if segue.identifier == "contactInfoAdded" {
          
        let controller = segue.destination as! ViewControllerForAddContact
        controller.delegate = self
        
      }

    }
    
    func didAddNewContact(_ controller: ViewControllerForAddContact, didFinish newContact : ContactInformation) {
        
        let newIndex = (contactsList.count)
        contactsList.append(newContact)
        let indexPath = IndexPath(row: newIndex, section: 0)
        contactTableTV.insertRows(at: [indexPath], with: .automatic)
        contactTableTV.reloadData()
    }
    
}
