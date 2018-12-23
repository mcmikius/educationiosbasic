//
//  TaskExtension.swift
//  Planner
//
//  Created by Michail Bondarenko on 12/23/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import Foundation

extension Task {
    func daysLeft() -> Int! {
        if self.deadline == nil {
            return nil
        }
        return (self.deadline?.offsetFrom(date: Date().today))!
    }
}
