//
//  StarWarsUniverse.swift
//  StarWars
//
//  Created by Eugenio Barquín on 23/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
import UIKit

//Representa un conjunto de personajes
class StarWarsUniverse {
 
    //MARK: - Utility type
    typealias StarWarsArray = [StarWarsCharacter]
    fileprivate typealias StarWarsDictionary = [StarWarsAffiliation : StarWarsArray]
    
    
    //MARK: - Properties
    fileprivate var dict : StarWarsDictionary = StarWarsDictionary()
    
    //MARK: - Initialization
    init(characters chars: StarWarsArray){
        
        //Asignamos afiliaciones y un StarWarsArray vacío a cada una de ellas
        dict = makeEmptyAffiliations()
        
        //Nos pateamos el array de starwars y asignamos segun afiliación
        for each in chars{
            dict[each.affiliation]?.append(each)
            
        }
    }
    
    //MARK: - Accessors
    var affiliationCount : Int {
        get{
            //Cuantas afiliaciones hay?
            return dict.count
        }
    }
    
    func characterCount(forAffiliation affiliation: StarWarsAffiliation) -> Int {
        
        guard let count = dict[affiliation]?.count else{
            return 0
        }
        return count
    }
    
    func character(atIndex index: Int, forAffiliation affiliation: StarWarsAffiliation) -> StarWarsCharacter{
        
        //el personaje nº index de la afiliacion affiliation
        let chars = dict[affiliation]!
        let char = chars[index]
        return char
    }
    
    func affiliationName(_ affiliation: StarWarsAffiliation) -> String{
        return affiliation.rawValue
    }
    
    
    //MARK: - Utils
    fileprivate func makeEmptyAffiliations() -> StarWarsDictionary {
        
        var d = StarWarsDictionary()
        d[.rebelAlliance] = StarWarsArray()
        d[.galacticEmpire] = StarWarsArray()
        d[.firstOrder] = StarWarsArray()
        d[.jabbaCriminalEmpire] = StarWarsArray()
        
        return d
    }
    
}
