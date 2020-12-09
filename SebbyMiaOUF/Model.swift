//
//  Model.swift
//  Miawouf
//
//  Created by Ambroise COLLON on 13/02/2018.
//  Copyright Â© 2018 OpenClassrooms. All rights reserved.
//

import Foundation

struct Pet {
    enum Gender {
        case male, female
    }

    var name: String?
    var hasMajority: Bool
    var phone: String?
    var race: String?
    var gender: Gender
}
