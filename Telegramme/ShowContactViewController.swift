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
    
    var friendController:FriendController = FriendController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //contactList = contactController.retrieveAllContact()
        self.tableView.reloadData() //refresh data
        
        let friend:Friend = Friend(friendname: "Simon", friendprofileImageName: "person")
        /*
        friendController.AddFriend(friend: friend)
        let d = Date()
        let message1:Message = Message(messageDate: d, messageIsSender: true, messageText: "Hello Core Data MAD 1")
        let message2:Message = Message(messageDate: d, messageIsSender: true, messageText: "Hello Core Data MAD 2")
        friendController.AddMessageToFriend(friend: friend, message: message1)
        friendController.AddMessageToFriend(friend: friend, message: message2)
        print(friendController.retrieveAllFriends().count)
        print(friendController.retrieveAllMessages().count)
        
        */
        let f1 = friendController.retriveMessagesbyFriend(friend: friend)
        print(f1)
        let friend2:Friend = Friend(friendname: "Fred", friendprofileImageName: "person")
        let f2 = friendController.retriveMessagesbyFriend(friend: friend2)
        print(f2)
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

