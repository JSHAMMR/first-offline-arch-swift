//
//  ViewController.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 21/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import CoreData
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var coreDataStack = CoreDataStack.shared
   
    fileprivate var page:Int = 1
    fileprivate var dataProvider: DataProvider!
    @IBOutlet var collectionProvider: CollectionProvider!
    
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
    
    public override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
         if UIDevice.current.orientation.isLandscape,
             let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             let width = view.frame.height - 22
             layout.itemSize = CGSize(width: width - 16, height: 160)
             layout.invalidateLayout()
         } else if UIDevice.current.orientation.isPortrait,
             let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             let width = view.frame.width - 22
             layout.itemSize = CGSize(width: width - 16, height: 160)
             layout.invalidateLayout()
         }
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataProvider = DataProvider(persistentContainer: coreDataStack.persistentContainer, repository: ApiRepository.shared)

        dataProvider.fetchCats(page: page) { (error) in
                   // Handle Error by displaying it in UI
            }
        // Do any additional setup after loading the view.
        

         collectionProvider = CollectionProvider(collectionView: self.collectionView, page: self.page, dataProvider: self.dataProvider, fetchedResultsController: self.fetchedResultsController,numberOfItemsPerRow: numberOfItemsPerRow,sectionInsets: sectionInsets,spacing: spacing)
        
       
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }


}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

        collectionView.delegate = self.collectionProvider
        collectionView.dataSource = self.collectionProvider

        
        
        collectionView.reloadData()
        
        
    }
}
