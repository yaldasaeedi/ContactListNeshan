//
//  ViewController.swift
//  Contact List
//
//  Created by Helen Besharatian on 6/6/1402 AP.


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchForContactSB: UISearchBar!
    @IBOutlet weak var contactTableTV: UITableView!
    
    private var contactsList : UserManeger? //todo : do it like what hoorad saied
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
}
protocol ViewControllerForAddUserDelegate: AnyObject {
    func didAddNewContact(_ controller: ViewControllerForAddUser, didFinish newContact : UserInformation)
}

extension ViewController: UITableViewDelegate, UITableViewDataSource , ViewControllerForAddUserDelegate{
    
    func numberOfSections(in tableView:UITableView) -> Int{
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        
        return (contactsList?.getContactsArrey().count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = contactsList?.getContactsName()[indexPath.row]
        cell.detailTextLabel?.text = String((contactsList?.getContactsPhone()[indexPath.row])!)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactInfoAdded" {
            let controller = segue.destination as! ViewControllerForAddUser
        }
    }
    func didAddNewContact(_ controller: ViewControllerForAddUser, didFinish newContact : UserInformation) {
        let newIndex = (contactsList?.getContactsArrey().count)
        contactsList?.addNewContact(new: newContact)
        let indexPath = IndexPath(row: newIndex!, section: 0)
        contactTableTV.insertRows(at: [indexPath], with: .automatic)
        contactTableTV.reloadData()
    }
    
}
