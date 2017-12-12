//
//  ViewController.swift
//  FoodApp
//
//  Created by Hazem on 11/27/17.
//  Copyright © 2017 Hazem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
var FoodList = Array<FoodDesc>()
    @IBOutlet weak var ListOfItem: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ReadFromPList()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // Number Of Items In Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodList.count
    }
    // Display The Item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FoodCell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodcell", for: indexPath) as! FoodCell
        cell.FoodLabel.text = FoodList[indexPath.row].Name!
        cell.FoodImage.image = UIImage(named: FoodList[indexPath.row].Image!)
        return cell
    }
    // What Happen When Select Cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: FoodList[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distenation = segue.destination as? ViewController2{
            if let Food = sender as? FoodDesc{
                distenation.SingleItem = Food
            }
        }
    }
    func ReadFromPList(){
        // Get The Path For The Foods.plist File Inside The Project File
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")!
        // Get The Full URL
        let url = URL(fileURLWithPath: path)
        // Read The Data
        let data = try! Data(contentsOf: url)
        // Now Convert This Data Into Plist
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        // Now Convert The Plist To Array
        let dicArray = plist as! [[String:String]]
        // Rad Each Item In Array
        for dic in dicArray{
            FoodList.append(FoodDesc(Name: dic["Name"], Description: dic["Des"], Image: dic["Image"]))
        }
    }
}

