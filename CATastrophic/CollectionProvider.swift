//
//  CollectionProvider.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 24/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import CoreData

class CollectionProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    fileprivate var collectionView: UICollectionView!

    fileprivate var page:Int = 1
    fileprivate var dataProvider: DataProvider!

    private let reuseIdentifier = "CatCollectionViewCell"
    private let percentageDetucted:CGFloat  = 20.0

    fileprivate var fetchedResultsController:NSFetchedResultsController<Cat>!
    fileprivate var numberOfItemsPerRow:CGFloat!

    fileprivate var sectionInsets : UIEdgeInsets!
    fileprivate var spacing:CGFloat!
    
    override init() {
        
    }

    init(collectionView : UICollectionView , page:Int , dataProvider: DataProvider , fetchedResultsController:NSFetchedResultsController<Cat> , numberOfItemsPerRow:CGFloat , sectionInsets:UIEdgeInsets,spacing:CGFloat) {
        self.collectionView = collectionView
        self.page = page
        self.dataProvider = dataProvider
        self.fetchedResultsController = fetchedResultsController
        self.numberOfItemsPerRow = numberOfItemsPerRow
        self.sectionInsets = sectionInsets
        self.spacing = spacing
    }
    

      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
                

                UIView.animate(withDuration: 0.5, delay: 0.4,
                    options: .curveEaseOut,
                    animations:{
                        catCell.overlay.alpha = 0

                    }
                )

                UIView.animate(withDuration: 0.5, delay: 0.4,
                    options: .curveEaseIn,
                    animations:{
                        catCell.icon.alpha = 1

                    }
                )
      
            } else {
                UIView.animate(withDuration: 0.5, delay: 0.4,
                    options: .curveEaseOut,
                    animations:{
                        catCell.icon.alpha = 0

                    }
                )

                UIView.animate(withDuration: 0.5, delay: 0.4,
                    options: .curveEaseIn,
                    animations:{
                        catCell.overlay.alpha = 1

                    }
                )
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
