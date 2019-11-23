//
//  Cat+CoreDataProperties.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 22/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//
//

import Foundation
import CoreData


extension Cat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cat> {
        return NSFetchRequest<Cat>(entityName: "Cat")
    }

    @NSManaged public var height: Int32
    @NSManaged public var id: String?
    @NSManaged public var url: String?
    @NSManaged public var width: Int32
    @NSManaged public var breed: Breed?
    @NSManaged public var catogery: Category?

}
