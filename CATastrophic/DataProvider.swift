//
//  DataProvider.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 21/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//
import CoreData

class DataProvider {
    
    private let persistentContainer: NSPersistentContainer
    private let repository: ApiRepository
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(persistentContainer: NSPersistentContainer, repository: ApiRepository) {
        self.persistentContainer = persistentContainer
        self.repository = repository
    }
    
    func fetchCats(page:Int , completion: @escaping(Error?) -> Void) {
        repository.getCats(page: page) { catDecodeModels, error in
            if let error = error {
                completion(error)
                return
            }
            
            guard let catDecodeModels = catDecodeModels else {
                let error = NSError(domain: dataErrorDomain, code: DataErrorCode.wrongDataFormat.rawValue, userInfo: nil)
                completion(error)
                return
            }
            
            let taskContext = self.persistentContainer.newBackgroundContext()
            taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            taskContext.undoManager = nil
            
            _ = self.syncCats(catDecodeModels: catDecodeModels, taskContext: taskContext)
            
            completion(nil)
        }
    }
    
    private func syncCats(catDecodeModels: [DCatDecodeModelElement], taskContext: NSManagedObjectContext) -> Bool {
        var successfull = false
        taskContext.performAndWait {
            let matchingCatListRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cat")
            let catId = catDecodeModels.map { $0.id }.compactMap { $0 }
            matchingCatListRequest.predicate = NSPredicate(format: "id in %@", argumentArray: [catId])
            
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: matchingCatListRequest)
            batchDeleteRequest.resultType = .resultTypeObjectIDs
            
            // Execute the request to de batch delete and merge the changes to viewContext, which triggers the UI update
            do {
                let batchDeleteResult = try taskContext.execute(batchDeleteRequest) as? NSBatchDeleteResult
                
                if let deletedObjectIDs = batchDeleteResult?.result as? [NSManagedObjectID] {
                    NSManagedObjectContext.mergeChanges(fromRemoteContextSave: [NSDeletedObjectsKey: deletedObjectIDs],
                                                        into: [self.persistentContainer.viewContext])
                }
            } catch {
                print("Error: \(error)\nCould not batch delete existing records.")
                return
            }
            
            // Create new records.
            for catDecodeModel in catDecodeModels {
                
                guard let catModel = NSEntityDescription.insertNewObject(forEntityName: "Cat", into: taskContext) as? Cat else {
                    print("Error: Failed to create a new Cat object!")
                    return
                }
                
                
                 do {
                    try catModel.update(catDecodeModel: catDecodeModel, taskContext: taskContext)
                    print(catModel)

                } catch {
                        print("Error: \(error)\nThe quake object will be deleted.")
                        taskContext.delete(catModel)
                    }
                }
            
            // Save all the changes just made and reset the taskContext to free the cache.
            if taskContext.hasChanges {
                do {
                    try taskContext.save()
                } catch {
                    print("Error: \(error)\nCould not save Core Data context.")
                }
                taskContext.reset() // Reset the context to clean up the cache and low the memory footprint.
            }
            successfull = true
        }
        return successfull
    }
    
    
}
