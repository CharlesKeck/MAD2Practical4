//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by Charles on 15/9/19.
//  Copyright © 2019 Charles. All rights reserved.
//

import Foundation

import UIKit

class ShowContactViewController : UITableViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var contactController:ContactController = ContactController()
    var contactList:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //contactList = contactController.retrieveAllContact()
        self.tableView.reloadData() //refresh data
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        contactList = contactController.retrieveAllContact()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
}

