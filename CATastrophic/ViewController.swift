//
//  ViewController.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 21/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var coreDataStack = CoreDataStack.shared

    var dataProvider: DataProvider!
      lazy var fetchedResultsController: NSFetchedResultsController<Cat> = {
          let fetchRequest = NSFetchRequest<Cat>(entityName:"Cat")
          fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending:true)]
          
          let controller = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                      managedObjectContext: dataProvider.viewContext,
                                                      sectionNameKeyPath: nil, cacheName: nil)
          controller.delegate = self
          
          do {
              try controller.performFetch()
          } catch {
              let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
          
          return controller
      }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataProvider = DataProvider(persistentContainer: coreDataStack.persistentContainer, repository: ApiRepository.shared)

        dataProvider.fetchCats(page: 1) { (error) in
                   // Handle Error by displaying it in UI
            }
        // Do any additional setup after loading the view.
    }


}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    }
}
