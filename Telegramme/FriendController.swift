//
//  FriendController.swift
//  Telegramme
//
//  Created by Charles on 18/9/19.
//  Copyright © 2019 Charles. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FriendController {
    
    func AddFriend(friend:Friend)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
        
            let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
            
            let person = NSManagedObject(entity: entity, insertInto: context)
            person.setValue(friend.name, forKeyPath: "name")
            person.setValue(friend.profileImageName, forKeyPath: "profileImageName")
            do {
                try context.save()
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
    }
    
    func AddMessageToFriend(friend:Friend, message:Message)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let messageEntity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
        
        let cdmessage = NSManagedObject(entity: messageEntity, insertInto: context)
        cdmessage.setValue(message.date, forKey: "date")
        cdmessage.setValue(message.isSender, forKey: "isSender")
        cdmessage.setValue(message.text, forKey: "text")

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.name)
        
        do {
            let test = try context.fetch(fetchRequest)
            let cdfriend = test[0]
            // Relationship
            cdmessage.setValue(cdfriend, forKey: "friend")
            try context.save()
        }
        catch
        {
            print(error)
        } 
            
    }
        
    func retriveMessagesbyFriend(friend:Friend)->[Message]
    {
        var messageList:[Message] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CDMessage>(entityName: "CDMessage")
        
        fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.name)
        do
         {
            let list:[NSManagedObject] = try context.fetch(fetchRequest)
            for m in list {
                let d = m.value(forKeyPath: "date") as! Date
                let b = m.value(forKeyPath: "isSender") as! Bool
                let t = m.value(forKeyPath: "text") as! String
                print("\(d) \(b), \(t)")
                messageList.append(Message(messageDate: d, messageIsSender: b, messageText: t))
            }
            
        }
         catch
         {
             print(error)
         }
        return messageList
    }
    

    
    func retrieveAllFriends()->[Friend]
    {
        var friendList:[Friend] = []
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
            do {
                let list:[NSManagedObject] = try context.fetch(fetchRequest)
                
                for f in list {
                    let name = f.value(forKeyPath: "name") as! String
                    let profileImageName = f.value(forKeyPath: "profileImageName") as! String
                    
                    print("\(name) \(profileImageName)")
                    friendList.append(Friend(friendname: name, friendprofileImageName: profileImageName))
                }
                
            } catch let error as NSError {
              print("Could not fetch. \(error), \(error.userInfo)")
            }
            return friendList
        }
    
    func retrieveAllMessages()->[Message]
    {
        var messageList:[Message] = []
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDMessage")
            do {
                let list:[NSManagedObject] = try context.fetch(fetchRequest)
                
                for m in list {
                    let d = m.value(forKeyPath: "date") as! Date
                    let b = m.value(forKeyPath: "isSender") as! Bool
                    let t = m.value(forKeyPath: "text") as! String
                    print("\(d) \(b), \(t)")
                    messageList.append(Message(messageDate: d, messageIsSender: b, messageText: t))
                }
                
            } catch let error as NSError {
              print("Could not fetch. \(error), \(error.userInfo)")
            }
            return messageList
        }
}
