//
//  Meal.swift
//  FoodTracker
//
//  Created by Michail Bondarenko on 10/29/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit


class Meal {
    
    //MIKE: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MIKE: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}
