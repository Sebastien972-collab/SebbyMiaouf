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
    enum Status {
        case accepted
        case rejected(String)
    }
    var status : Status{
        if name == nil || name == "" {
            return .rejected("Vous n'avez pas renseigner votre nom")
        }
        else if phone == nil || phone == "" {
            return .rejected("Vous n'avez pas renseigner votre numero de mobile")
        }
       else if race == nil || race == "" {
            return .rejected("Vous n'avez pas renseigner votre race")
        }
       else if !hasMajority {
            return .rejected("Les mineurs ne sont pas admis ")
        }
       else{
        return .accepted
       }
    }
}
