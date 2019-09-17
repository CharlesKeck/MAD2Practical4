//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by Charles on 14/9/19.
//  Copyright © 2019 Charles. All rights reserved.
//

import Foundation

import UIKit

class AddContactViewController : UIViewController {
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    
    @IBAction func createBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        var contact:Contact = Contact(firstname: String(firstNameFld.text ?? ""), lastname: String(lastNameFld.text ?? ""), mobileno: String(mobileFld.text ?? ""))
        
        appDelegate.contactList.append(contact)
        print(String(appDelegate.contactList.count))
        
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
        
        tabBarController?.selectedIndex = 1
        
    }
    
}
