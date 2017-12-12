//
//  ViewController2.swift
//  FoodApp
//
//  Created by Hazem on 11/27/17.
//  Copyright © 2017 Hazem. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var SingleItem:FoodDesc?
    @IBOutlet weak var laImage: UIImageView!
    @IBOutlet weak var laName: UILabel!
    @IBOutlet weak var laDes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        laName.text = SingleItem?.Name
        laDes.text = SingleItem?.Description
        laImage.image = UIImage(named: (SingleItem?.Image!)!)
        // Do any additional setup after loading the view.
    }
    
    // To Dismiss Any Opend View So We Don't Use To Much Ram Space
    @IBAction func BackBtnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
