//
//  ForceSensitives.swift
//  StarWars
//
//  Created by Eugenio Barquín on 17/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
import UIKit

class ForceSensitive: StarWarsCharacter {
    
    //MARK: Stored Properties
    let midichlorians : Int
    
    //MARK: Initialization
    init(firstName: String?, lastName: String?,
         alias: String, sound: Data,
         photo: UIImage, wikiURL: URL,
         affiliation: StarWarsAffiliation, midichlorians: Int) {
        
        self.midichlorians = midichlorians
        super.init(firstName: firstName, lastName: lastName,
                   alias: alias, sound: sound,
                   photo: photo, wikiURL: wikiURL,
                   affiliation: affiliation)
    }
    
    convenience init(jediWithFirstName: String?,
                     lastName: String?,
                     alias: String,
                     soundData: Data,
                     photo: UIImage,
                     url: URL,
                     midichlorians: Int) {
        
        self.init(firstName: jediWithFirstName, lastName: lastName,
                  alias: alias, sound: soundData,
                  photo: photo, wikiURL: url,
                  affiliation: .rebelAlliance,
                  midichlorians: midichlorians)
    }
    
    
    convenience init(sithWithFirstName: String?,
                     lastName: String?,
                     alias: String,
                     soundData: Data,
                     photo: UIImage,
                     url: URL,
                     midichlorians: Int) {
        
        self.init(firstName: sithWithFirstName, lastName: lastName,
                  alias: alias, sound: soundData,
                  photo: photo, wikiURL: url,
                  affiliation: .galacticEmpire,
                  midichlorians: midichlorians)
    }
    
    //MARK - Proxies
    override func proxyForEquality() -> String {
        return "\(super.proxyForEquality())\(midichlorians)"
    }
    //no es necesario implementar el operador == pues hereda de la superclase, y utiliza el proxy adecuado debido a que lo hemos sobreescrito.
    
    override func proxyForComparison() -> String {
        return proxyForEquality()
    }
}
