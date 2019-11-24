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
    private let reuseIdentifier = "CatCollectionViewCell"
    private let numberOfItemsPerRow:CGFloat = 3

    private let sectionInsets = UIEdgeInsets(top: 15,
                                                left: 15,
                                                bottom: 15,
                                                right: 15)
    private let spacing:CGFloat = 15.0
    private let percentageDetucted:CGFloat  = 20.0

    fileprivate var page:Int = 1
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
        

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }


}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        collectionView.reloadData()
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(fetchedResultsController.sections?[section].numberOfObjects)
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CatCollectionViewCell
        
        let cat = fetchedResultsController.object(at: indexPath)

        
        print(cat.url!)
        

        cell.icon.sd_setImage(with: URL(string:cat.url!), placeholderImage: UIImage(named: "cat_paw"))

        // cell.title.text = "\(indexPath)"
        
        
        if indexPath.item + 1 == fetchedResultsController.sections?[indexPath.section].numberOfObjects {
            page = page + 1
            dataProvider.fetchCats(page: page) { (error) in
                             // Handle Error by displaying it in UI
                      }
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
       for cell in self.collectionView.visibleCells as [UICollectionViewCell]    {


        let catCell = cell as! CatCollectionViewCell

        let indexPath = self.collectionView.indexPath(for: cell as UICollectionViewCell)!
    
       // let attributes = self.collectionView.layoutAttributesForItem(at: indexPath)
        
        
        let perc = (catCell.frame.height * percentageDetucted ) / 100
        let rect = CGRect(x: catCell.frame.minX, y: catCell.frame.minY, width: catCell.frame.width, height: catCell.frame.height - perc)

        if scrollView.bounds.contains(rect) {
            
            catCell.overlay.isHidden = true
            catCell.icon.isHidden = false
            
        } else {
            catCell.overlay.isHidden = false
            catCell.icon.isHidden = true

        }
        }
        
    }

    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
       
        
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let height = view.frame.size.height
//        let width = view.frame.size.width
//        // in case you you want the cell to be 40% of your controllers view
//        return CGSize(width: width * 0.5, height: height * 0.5)
//    }
//
    
   
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacingBetweenCells:CGFloat = 16

        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row

        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
}
    
    
}

