//
//  Birthday.swift
//  BirthdayTracker
//
//  Created by Well on 9/3/24.
//

import Foundation
class Birthday {
    let firstName: String
    let lastName: String
    let birthdate: Date
    
    init(firstName: String, lastName: String, birthdate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
    }
}
