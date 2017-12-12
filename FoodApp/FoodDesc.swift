//
//  FoodDesc.swift
//  FoodApp
//
//  Created by Hazem on 11/27/17.
//  Copyright © 2017 Hazem. All rights reserved.
//
// This Class To Creat Object That Will Have Image,Name And Description [This Info Will Apper When Click On One Of The Collection View Cell's]
import Foundation
class FoodDesc{
    var Name:String?
    var Description:String?
    var Image:String?
    init(Name:String?,Description:String?,Image:String?) {
        self.Name = Name
        self.Description = Description
        self.Image = Image
    }
}
