//
//  CategoryCollectionViewController.swift
//  OnlineEcommerceApp
//
//  Created by User on 23/10/22.
//

import UIKit


class CategoryCollectionViewController: UICollectionViewController {
    
//    MARK: Vars
    
    var categoryArray : [Category] = []
    
    private let sectionInset = UIEdgeInsets(top: 20.0, left: 30.0, bottom: 20.0, right: 30.0)
    private let itemsPerRow: CGFloat = 3

//    MARK:  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadCategories()
        
    }
    

//     MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return categoryArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.generateCategory(categoryArray[indexPath.row ])
        
        return cell 
    }
    
//    MARK: Download Categories
        
        private func loadCategories(){
            downloadCategoriesFromFirebase {  (allCategories) in
                self.categoryArray = allCategories
                self.collectionView.reloadData()
            }
        }
    
//    MARK:  UICollectionView Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "categoryToItemSeg", sender: categoryArray[indexPath.row])
    }
    
//    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoryToItemSeg"{
            let vc = segue.destination as! ItemsTableViewController
            vc.category = sender as! Category
        }
    }
    
}


extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInset.left * (itemsPerRow+1)
        let availabeWidth  = view.frame.width - paddingSpace
        let withPerItem = availabeWidth / itemsPerRow
        
        return CGSize(width: withPerItem, height: withPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         
        return sectionInset.left
    }
}
