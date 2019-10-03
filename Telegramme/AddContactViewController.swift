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
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate

        //var contact:Contact = Contact(firstname: String(firstNameFld.text ?? ""), lastname: String(lastNameFld.text ?? ""), mobileno: String(mobileFld.text ?? ""))
        
        //appDelegate.contactList.append(contact)
        //print(String(appDelegate.contactList.count))
        
        let contactController:ContactController = ContactController()
        
        let contact:Contact = Contact(firstname: String(firstNameFld.text!), lastname: String(lastNameFld.text!), mobileno: String(mobileFld.text!))
        
        contactController.AddContact(newContact: contact)
        
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
        
        tabBarController?.selectedIndex = 1
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.testThread()
        }

        
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func testThread(){
        for i in 1...3 {
            Thread.sleep(forTimeInterval: 3.0) //Sleep for 3 seconds
            print("\(i)")
        }
        DispatchQueue.main.async {
            self.onCompletion()
        }
    }
    
    func onCompletion(){
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
}
