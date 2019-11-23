//
//  Weight+CoreDataProperties.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 22/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//
//

import Foundation
import CoreData


extension Weight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weight> {
        return NSFetchRequest<Weight>(entityName: "Weight")
    }

    @NSManaged public var imperial: String?
    @NSManaged public var metric: String?

}
