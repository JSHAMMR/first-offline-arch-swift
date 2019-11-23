//
//  Category+CoreDataProperties.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 22/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?

}
