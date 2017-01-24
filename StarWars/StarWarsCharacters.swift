//
//  StarWarsCharacters.swift
//  StarWars
//
//  Created by Eugenio Barquín on 17/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacter {
    
    //MARK: - Stored properties
    let firstName   :   String?
    let lastName    :   String?
    let alias       :   String
    let soundData   :   Data
    let photo       :   UIImage
    let url         :   URL
    let affiliation :   StarWarsAffiliation
    
    //MARK: - Computed Properties
    var name : String? {
        get{
            //Si al desempaquetar firstName en first descubrimos un nil entonces devuelve lastName
            guard let first = firstName else {
                return lastName
            }
            guard let last = lastName else {
                return first
            }
            
            return "\(first) \(last)"
            
        }
    }
    
    
    //MARK: - Initialization
    init(firstName: String?,
         lastName: String?,
         alias: String,
         sound: Data,
         photo: UIImage,
         wikiURL: URL,
         affiliation: StarWarsAffiliation){
        
        self.firstName = firstName
        self.lastName = lastName
        self.alias = alias
        soundData = sound
        self.photo = photo
        url = wikiURL
        self.affiliation = affiliation
    }
    
    convenience init(alias: String,
                     soundData: Data,
                     photo: UIImage,
                     affiliation: StarWarsAffiliation,
                     url: URL) {
        self.init(firstName: nil,
                  lastName: nil,
                  alias: alias,
                  sound: soundData,
                  photo: photo,
                  wikiURL: url,
                  affiliation: affiliation)
    }
    
    //MARK: - Proxies
    func proxyForEquality() -> String{
       
        //Creamos la representación textual en un String de un objeto
        return "\(firstName)\(lastName)\(alias)\(url)\(affiliation)\(photo.hashValue)\(soundData.hashValue)"
    }
    
    func proxyForComparison() -> String {
        return proxyForEquality()
    }
}

    //MARK: - Protocols

extension StarWarsCharacter : Equatable {
    
    //El Self (con mayúscula) indica que lhs y rhs tienen que ser del mismo tipo que implementa la clase equatable, en nuestro caso StarWarsCharacter.
    
    public static func ==(lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool{
        
        //Para comprobar que dos personajes son iguales se lo mandamos a un pringado. En este caso el pringado es proxy
        return (lhs.proxyForEquality() == rhs.proxyForEquality())
    }
    
}

extension StarWarsCharacter: Comparable {
    
    public static func <(lhs: StarWarsCharacter, rhs:StarWarsCharacter) -> Bool{
        return (lhs.proxyForComparison() < rhs.proxyForComparison())
    }
    //Aunque deberíamos implementar todos métodos al tener los el "<" y el "==" con eso ya tiene todo ya tiene suficiente porque tiene suficiente información para generarlos. 
}

extension StarWarsCharacter : CustomStringConvertible {
    //Este protocolo crea una representación textual de una instancia
    
    public var description: String {
        get{
            //la función type of: nos devuelve el nombre de la clase. Si pusieramos StarwarsCharacter en el caso de utilizarlo en una subclase (ForceSensitives) nos también diría que es un StarWarsCharacter, lo que nos sería un error. Nos ahorramos hacer un override de la función.
            return "<\(type(of:self)): \(name) -- \(alias)>"
        }
    }
}
