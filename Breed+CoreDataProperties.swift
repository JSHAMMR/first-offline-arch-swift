//
//  Breed+CoreDataProperties.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 22/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//
//

import Foundation
import CoreData


extension Breed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Breed> {
        return NSFetchRequest<Breed>(entityName: "Breed")
    }

    @NSManaged public var adaptability: Int32
    @NSManaged public var affection_level: Int32
    @NSManaged public var alt_names: String?
    @NSManaged public var child_friendly: Int32
    @NSManaged public var country_code: String?
    @NSManaged public var country_codes: String?
    @NSManaged public var detail: String?
    @NSManaged public var dog_friendly: Int32
    @NSManaged public var energy_level: Int32
    @NSManaged public var experimental: Int32
    @NSManaged public var grooming: Int32
    @NSManaged public var hairless: Int32
    @NSManaged public var health_issues: Int32
    @NSManaged public var hypoallergenic: Int32
    @NSManaged public var id: String?
    @NSManaged public var indoor: Int32
    @NSManaged public var intelligence: Int32
    @NSManaged public var lap: Int32
    @NSManaged public var life_span: String?
    @NSManaged public var name: String?
    @NSManaged public var natural: Int32
    @NSManaged public var origin: String?
    @NSManaged public var rare: Int32
    @NSManaged public var rex: Int32
    @NSManaged public var shedding_level: Int32
    @NSManaged public var short_legs: Int32
    @NSManaged public var social_needs: Int32
    @NSManaged public var stranger_friendly: Int32
    @NSManaged public var suppressed_tail: Int32
    @NSManaged public var temperament: String?
    @NSManaged public var vetstreet_url: String?
    @NSManaged public var vocalisation: Int32
    @NSManaged public var wikipedia_url: Int32
    @NSManaged public var weight: Weight?

}
