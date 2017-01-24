//
//  StarWarsAffiliation.swift
//  StarWars
//
//  Created by Eugenio Barquín on 17/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

enum StarWarsAffiliation : String {
    case galacticEmpire         = "Galactic Empire"
    case rebelAlliance          = "Rebel Alliance"
    case firstOrder             = "First Order"
    case jabbaCriminalEmpire    = "Jabbas's Criminal Empire"
    case unknow                 = "Unknown"
    
    static func by(name: String) ->StarWarsAffiliation {
        
        let aff : StarWarsAffiliation
        
        switch name {
        case StarWarsAffiliation.galacticEmpire.rawValue:
            aff = .galacticEmpire
            
        case StarWarsAffiliation.rebelAlliance.rawValue:
            aff = .rebelAlliance
            
        case StarWarsAffiliation.firstOrder.rawValue:
            aff = .firstOrder
            
        case StarWarsAffiliation.jabbaCriminalEmpire.rawValue:
            aff = .jabbaCriminalEmpire
            
        default:
            aff = .unknow
        }
        return aff
    }
    // En el caso de que tengamos un String? comprobamos que el la constante tiene algo y en el caso de que así sea devolvemos la función de arriba. Swift sabe que tiene que devolver la función de arriba en vez de la de abajo porque le estamos mandando un String, no un String?
    static func by(name: String?) ->StarWarsAffiliation{
        
        guard let realName = name else {
            return .unknow
            
        }
        return by(name: realName)
    }
    
    
}
