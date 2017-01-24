//
//  FoundationExtensions.swift
//  StarWars
//
//  Created by Eugenio Barquín on 21/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

extension Bundle {
    
    func url(forResource name: String) -> URL?{
     
        //Partir el nombre por el .
        let tokens = name.components(separatedBy: ".")
        
        //Si sale bien, crea la url
        return self.url(forResource: tokens[0], withExtension: tokens[1])
    }
}
