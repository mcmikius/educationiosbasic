//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Michail Bondarenko on 10/24/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit



//class RatingControl: UIStackView {
    
@IBDesignable class RatingControl: UIStackView {
    
    //MIKE: Properties
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButton()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet{
            setupButton()
        }
    }
    
    private var ratingButtons = [UIButton]()
    
    var rating = 0

    //MIKE: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MIKE: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    //MIKE: Private Methods
    
    private func setupButtons() {
        
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
        // Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // Add the button to the stack
        addArrangedSubview(button)
            
        // Add the new button to the rating button array
        ratingButtons.append(button)
            
        }
        
        }
        
    }

//}
