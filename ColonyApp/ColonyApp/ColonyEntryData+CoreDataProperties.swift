//
//  ColonyEntryData+CoreDataProperties.swift
//  ColonyApp
//
//  Created by 川守田敦史 1 on 2016/05/29.
//  Copyright © 2016年 Atsushi Kawamorita. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ColonyEntryData {

    @NSManaged var what_data: String?
    @NSManaged var when_data: NSTimeInterval
    @NSManaged var where_data: String?
    @NSManaged var who_data: String?
    @NSManaged var whom_data: String?
    @NSManaged var how_data: String?
    @NSManaged var howmuch_data: NSDecimalNumber?
    @NSManaged var howmany_data: Int64
    @NSManaged var userID: NSData?
    @NSManaged var createDate: NSTimeInterval

}
