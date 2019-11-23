//
//  Cat+CoreDataClass.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 22/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Cat)
public class Cat: NSManagedObject {
    

    func update(catDecodeModel:DCatDecodeModelElement ,taskContext : NSManagedObjectContext )  {
        
        
        
       
        if let  id = catDecodeModel.id ,
           let  url = catDecodeModel.url ,
           let  height = catDecodeModel.height ,
           let  width = catDecodeModel.width
            {

                self.id = id
                self.url = url
                self.height = Int32(height)
                self.width = Int32(width)
                

//                do {
//                    if  try getCatogery(catDecodeModel: catDecodeModel, taskContext: taskContext) != nil {
//                          //  self.catogery =  try getCatogery(catDecodeModel: catDecodeModel,taskContext : taskContext )
//
//                        }
//                    if  try getBreed(catDecodeModel: catDecodeModel) != nil {
//                        //self.breed = try getBreed(catDecodeModel: catDecodeModel)
//
//                    }
//                    } catch let error {
//
//
//                        print(error)
//                }

                  

            }
        
        
    }
    
    
     func getWeight(catDecodeModel:DCatDecodeModelElement) throws-> Weight {
            
            
            let weight = Weight()
                              
            weight.imperial = (catDecodeModel.breeds?.first?.weight.flatMap({$0.imperial}))!
            weight.metric = (catDecodeModel.breeds?.first?.weight.flatMap({$0.metric}))!

           return weight

        }
        
        
        func getBreed(catDecodeModel:DCatDecodeModelElement) throws-> Breed {
            
            
            var tempBreed =  Breed()
            
            guard let breed = catDecodeModel.breeds?.first else {
                
                return tempBreed
            }
            
              if let  adaptability = breed.adaptability ,
              let  affection_level = breed.affectionLevel ,
              let  alt_names = breed.altNames ,
              let  child_friendly = breed.childFriendly ,
              let  country_code = breed.countryCode ,
              let  country_codes = breed.countryCodes ,
              let  detail = breed.breedDescription ,
              let  dog_friendly = breed.dogFriendly ,
              let  energy_level = breed.energyLevel ,
              let  experimental = breed.experimental ,
              let  grooming = breed.grooming ,
              let  hairless = breed.hairless ,
              let  health_issues = breed.healthIssues ,
              let  hypoallergenic = breed.hypoallergenic ,
              let  id = breed.id ,
              let  indoor = breed.indoor ,
              let  intelligence = breed.intelligence ,
              let  lap = breed.lap ,
              let  life_span = breed.lifeSpan ,
              let  name = breed.name ,
              let  natural = breed.natural ,
              let  origin = breed.origin ,
              let  rare = breed.rare ,
              let  rex = breed.rex ,
              let  shedding_level = breed.sheddingLevel ,
              let  short_legs = breed.shortLegs ,
              let  social_needs = breed.socialNeeds ,
              let  stranger_friendly = breed.strangerFriendly ,
              let  suppressed_tail = breed.suppressedTail ,
              let  temperament = breed.temperament ,
              let  vetstreet_url = breed.vetstreetURL ,
              let  vocalisation = breed.vocalisation ,
              let  wikipedia_url = breed.wikipediaURL
              {
                let returnBreed = Breed()

                returnBreed.adaptability = Int32(adaptability)
                returnBreed.affection_level = Int32(affection_level)
                returnBreed.alt_names = alt_names
                returnBreed.child_friendly = Int32(child_friendly)
                returnBreed.country_code = country_code
                returnBreed.country_codes = country_codes
                returnBreed.detail = detail
                returnBreed.dog_friendly = Int32(dog_friendly)
                returnBreed.energy_level = Int32(energy_level)
                returnBreed.experimental = Int32(experimental)
                returnBreed.grooming = Int32(grooming)
                returnBreed.hairless = Int32(hairless)
                returnBreed.health_issues = Int32(health_issues)
                returnBreed.hypoallergenic = Int32(hypoallergenic)
                returnBreed.id = id
                returnBreed.indoor = Int32(indoor)
                returnBreed.intelligence = Int32(intelligence)
                returnBreed.lap = Int32(lap)
                returnBreed.life_span = life_span
                returnBreed.name = name
                returnBreed.natural = Int32(natural)
                returnBreed.origin = origin
                returnBreed.rare = Int32(rare)
                returnBreed.rex = Int32(rex)
                returnBreed.shedding_level = Int32(shedding_level)
                returnBreed.short_legs = Int32(short_legs)
                returnBreed.social_needs = Int32(social_needs)
                returnBreed.stranger_friendly = Int32(stranger_friendly)
                returnBreed.suppressed_tail = Int32(suppressed_tail)
                returnBreed.temperament = temperament
                returnBreed.vetstreet_url = vetstreet_url
                returnBreed.vocalisation = Int32(vocalisation)
                returnBreed.wikipedia_url = Int32(wikipedia_url)!
                returnBreed.weight = try getWeight(catDecodeModel: catDecodeModel)
        
                tempBreed =  returnBreed

                
            }
            
            return tempBreed
            
        }
        
        func getCatogery(catDecodeModel:DCatDecodeModelElement,taskContext : NSManagedObjectContext) throws-> Category {
              
            
            var tempCatogery  : Category?
            
            guard let catogery = catDecodeModel.categories?.first else {
                
                print("test")
                  
                return  Category()
              }
            
            
            if let  id = catogery.id ,
                let  name = catogery.name  {
                
                let catogeryDb = Category()
                catogeryDb.id = Int32(id)
                catogeryDb.name = name
               // let returnCatogery = Category(id: Int32(id), name: name, insertIntoManagedObjectContext: taskContext)

                
              
                tempCatogery = catogeryDb

            }
            
            return tempCatogery!
        }
        

}
