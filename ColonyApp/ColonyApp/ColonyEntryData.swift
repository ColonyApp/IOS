//
//  ColonyEntryData.swift
//  ColonyApp
//
//  Created by 川守田敦史 1 on 2016/05/28.
//  Copyright © 2016年 Atsushi Kawamorita. All rights reserved.
//

import Foundation
import CoreData


class ColonyEntryData: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    func insert(appDelegete :AppDelegate
              , userId: NSData?
              , whatData: String?
              , whenData: NSTimeInterval?
              , whereData: String?
              , whoData: String?
              , whomData: String?
              , howData: String?
              , howmuchData: NSDecimalNumber?
              , howmanyData: Int64?
              , createDateData: NSTimeInterval)->Bool{
        
        var returnValue: Bool = false
        
        do{
            let data = NSEntityDescription.insertNewObjectForEntityForName("ColonyEntryData", inManagedObjectContext: appDelegete.managedObjectContext) as! ColonyEntryData
            
            data.userID = userId!
            data.what_data = whatData
            data.when_data = whenData!
            data.where_data = whereData
            data.who_data = whoData
            data.whom_data = whomData
            data.how_data = howData
            data.howmuch_data = howmuchData
            data.howmany_data = howmanyData!
            data.createDate = createDateData
            
            appDelegete.saveContext()
            
            returnValue = true
            
        } catch let error as NSError {
            print(error.description)
        }
        return returnValue
    }
    func update(appDelegete :AppDelegate
              , userID: NSData?
              , whatData: String?
              , whenData: NSTimeInterval?
              , whereData: String?
              , whoData: String?
              , whomData: String?
              , howData: String?
              , howmuchData: NSDecimalNumber?
              , howmanyData: Int64?
              , createDateData: NSTimeInterval)->Bool{

        let fetchRequest = NSFetchRequest(entityName: "ColonyEntryData")
        let predicate = NSPredicate(format: "userID = %@ AND createDate = %d", userID!, createDateData)
        fetchRequest.predicate = predicate

        do{
            
            let colonyEntryDatas = try appDelegete.managedObjectContext.executeFetchRequest(fetchRequest) as! [ColonyEntryData]
            for c in colonyEntryDatas {
                c.what_data = whatData
                c.when_data = whenData!
                c.where_data = whereData
                c.who_data = whoData
                c.whom_data = whomData
                c.how_data = howData
                c.howmuch_data = howmuchData
                c.howmany_data = howmanyData!
            }
        }catch let error as NSError{
            print(error.description)
            return false
        }
        appDelegete.saveContext()
        
        return true
    }
    func delete(appDelegete :AppDelegate
              , userID: NSData?
              , whatData: String?
              , whenData: NSTimeInterval?
              , whereData: String?
              , whoData: String?
              , whomData: String?
              , howData: String?
              , howmuchData: NSDecimalNumber?
              , howmanyData: Int64?
              , createDateData: NSTimeInterval)->Bool{
            
            let fetchRequest = NSFetchRequest(entityName: "ColonyEntryData")
            let predicate = NSPredicate(format: "userID = %@ AND createDate = %d", userID!, createDateData)
            fetchRequest.predicate = predicate
            
            do{
                
                let colonyEntryDatas = try appDelegete.managedObjectContext.executeFetchRequest(fetchRequest) as! [ColonyEntryData]
                for c in colonyEntryDatas {
                    //appDelegete.managedObjectContext.deletedObjects(c)
                }
            }catch let error as NSError{
                print(error.description)
                return false
            }
            appDelegete.saveContext()
            
            return true
    }
}
