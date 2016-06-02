//
//  User+CoreDataProperties.swift
//  ColonyApp
//
//  Created by 川守田敦史 1 on 2016/05/28.
//  Copyright © 2016年 Atsushi Kawamorita. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var userID: NSData?
    @NSManaged var nickName: String?
    @NSManaged var mailAddress: String?
    @NSManaged var relationship: Group?
    @NSManaged var relationship1: GovernorMode?
    @NSManaged var relationship2: ColonyEntryData?

}
