//
//  ViewController.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/6/1402 AP.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contactTableTV: UITableView!
    
    var contactsModel = ContactsManager()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        contactTableTV.delegate = self
        contactTableTV.dataSource = self
        contactTableTV.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
       
        contactTableTV.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        contactTableTV.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowContactDetailSegue" {
            
            if let indexPath = sender as? IndexPath {

                let selectedContact = contactsModel.getContactsArray()[indexPath.row]
                if let destinationVC = segue.destination as? ViewControllerForAddContact {

                    destinationVC.contactViewMode = .viewAddEdit
                    destinationVC.contactForEdit = selectedContact
                    destinationVC.editingContactIndexPath = indexPath
                }
            }
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactsModel.getContactsArray().count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contactsModel.getContactsArray()[indexPath.row]
        cell.textLabel?.text = contact.getContactName()
        cell.imageView?.image = UIImage(data : contact.getContactImage())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            contactsModel.deleteContact(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowContactDetailSegue", sender: indexPath)
    }

}

