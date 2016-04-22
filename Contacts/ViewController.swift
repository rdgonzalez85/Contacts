//
//  ViewController.swift
//  Contacts
//
//  Created by Rodrigo Gonzalez on 4/22/16.
//  Copyright © 2016 Rodrigo Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "contacts" {
            guard let destinationView = segue.destinationViewController as? ContactsViewController else {
                return
            }
            destinationView.contacts = self.contacts()
            destinationView.delegate = self
        }
    }
    
    func contacts() -> [Contact] {
        let contact1 = Contact(firstName: "M", lastName: "Jack", detail: "m@j.com", image: "https://scontent-mia1-1.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/10868235_10153068640606473_3992284990222677775_n.jpg?oh=27bfd4e9cb2d3f49b2665ed969c30315&oe=5776138C")
        let contact2 = Contact(firstName: "M", lastName: "Jord", detail: "m@j.com", image: "https://scontent-mia1-1.xx.fbcdn.net/hprofile-xfa1/v/t1.0-1/c1.0.198.198/10626656_10152618575634194_4304052675892725873_n.jpg?oh=49f3c32e450ac4792aa94d302087cbf3&oe=57A6D4EF")
        contact2.nameOrder = .LastNameFirstName
        let contact3 = Contact(firstName: "M", lastName: "John", detail: "m@j.com", image: "https://scontent-mia1-1.xx.fbcdn.net/v/t1.0-9/521630_693642433983312_2033676293_n.jpg?oh=cd2fde958c33eb421d700589c3aec6f2&oe=57B8D16D")
        
        return [contact1, contact2, contact3,contact1, contact2, contact3,contact1, contact2, contact3,contact1, contact2, contact3,contact1, contact2, contact3]
    }
    
    @IBAction func contactButtonTapped(sender: AnyObject) {
        let contacts = ContactsViewController(contacts: self.contacts())
        contacts.delegate = self
        contacts.title = "Contacts"
        
        self.navigationController?.showViewController(contacts, sender: nil)
    }
}

extension ViewController : ContactsViewControllerDelegate {
    func contactSelected(contact: Contact) {
        print(contact.displayName())
    }
}