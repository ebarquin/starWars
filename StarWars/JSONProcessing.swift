//
//  JSONProcessing.swift
//  StarWars
//
//  Created by Eugenio Barquín on 21/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
import UIKit

/*
{
    "firstName"    : "Anakin",
    "lastName"     : "Skywalker",
    "alias"        : "Darth Vader",
    "soundFile"    : "vader.caf",
    "imageFile"    : "vader.jpg",
    "jedi"         : false,
    "sith"         : true,
    "affiliation"  : "Galactic Empire",
    "url"          : "https://en.wikipedia.org/wiki/Darth_Vader",
    "midichlorians": 15000
}
 */

//MARK: - Aliases
typealias JSONObject        =   AnyObject
//AnyObject representa cualquier tipo u objeto siempre que sea compatible con Objective C
typealias JSONDictionary    =   [String: JSONObject]
//JSONDictionary va a ser un diccionario de clave cadena y valor JSONObject

//Por último necesitamos un array de diccionarios que es en el fondo lo que nos va a llegar, es decir, un JSON. 
typealias JSONArray         = [JSONDictionary]

//MARK: - Decodification

func decode(StarWarsCharacter json: JSONDictionary) throws -> StarWarsCharacter{
    //Vamos a decodificar un StarWarsCharacter que viene en un JSON para obtener un StarWarsCharacter
    
    
    // Validamos el diccinario
    //Compruebo que la url existe y es una cadena.
    guard let urlString = json["url"] as? String,
        let url = URL(string:urlString) else {
            //la pringamos
            throw StarWarsError.wrongURLFormatForJSONResource
    }
    //Compruebo la Imagen (si está y si tiene el formato correcto
    guard let imageName = json["imageFile"] as? String,
        let image = UIImage(named: imageName) else {
            throw StarWarsError.resourcePointedByURLNotReachable
    }
    //Compruebo el fichero de sonido
    guard let soundName = json["soundFile"] as? String,
    let soundURL = Bundle.main.url(forResource: soundName),
        let sound = try? Data(contentsOf: soundURL) else {
           throw StarWarsError.resourcePointedByURLNotReachable
    }
    //Como alias es obligatorion no puede ser opcional por lo que usamos un guard
    guard let alias = json["alias"] as? String else{
        throw StarWarsError.wrongJASONFormat
    }

    //hemos comprobado todo lo más peligroso
    
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    

    
    //Solo queda la affiliation
    if let affiliationName = json["affiliation"] as? String {
        //Todo ha salido bien
        //Creamos el StarWarsCharacter
        
        return StarWarsCharacter(firstName: firstName,
                                 lastName: lastName,
                                 alias: alias,
                                 sound: sound,
                                 photo: image,
                                 wikiURL: url,
                                 affiliation: StarWarsAffiliation.by(name: affiliationName))
    }else{
        throw StarWarsError.wrongJASONFormat
    }
}

func decode(StarWarsCharacter json: JSONDictionary?) throws -> StarWarsCharacter {
    
    guard let json = json else {
        throw StarWarsError.nilJSONObject
    }
    return try decode(StarWarsCharacter: json)
}

func decode(forceSensitive json: JSONDictionary) throws -> ForceSensitive {
    
    // Validamos el diccinario
    //Compruebo que la url existe y es una cadena.
    guard let urlString = json["url"] as? String,
        let url = URL(string:urlString) else {
            //la pringamos
            throw StarWarsError.wrongURLFormatForJSONResource
    }
    //Compruebo la Imagen (si está y si tiene el formato correcto
    guard let imageName = json["imageFile"] as? String,
        let image = UIImage(named: imageName) else {
            throw StarWarsError.resourcePointedByURLNotReachable
    }
    //Compruebo el fichero de sonido
    guard let soundName = json["soundFile"] as? String,
        let soundURL = Bundle.main.url(forResource: soundName),
        let sound = try? Data(contentsOf: soundURL) else {
            throw StarWarsError.resourcePointedByURLNotReachable
    }
    //Como alias es obligatorion no puede ser opcional por lo que usamos un guard
    guard let alias = json["alias"] as? String else{
        throw StarWarsError.wrongJASONFormat
    }

    guard let jedi = json["jedi"] as? Bool,
        let sith = json["sith"] as? Bool,
        let md = json["midichlorians"] as? Int else {
            throw StarWarsError.wrongJASONFormat
    }
    guard jedi != sith else {
        throw StarWarsError.wrongJASONFormat
    }
    
    //hemos comprobado todo lo más peligroso
    
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    
    
    
    //Solo queda la affiliation
    if let affiliationName = json["affiliation"] as? String {
        //Todo ha salido bien
        //Creamos el StarWarsCharacter
        
        return ForceSensitive(firstName: firstName,
                              lastName: lastName,
                              alias: alias,
                              sound: sound,
                              photo: image,
                              wikiURL: url,
                              affiliation: StarWarsAffiliation.by(name: affiliationName),
                              midichlorians: md)

    }else{
        throw StarWarsError.wrongJASONFormat
    }

}

func decode(ForceSensitive json: JSONDictionary?) throws -> ForceSensitive {
    guard let json = json else {
        throw StarWarsError.nilJSONObject
    }
    return try decode(ForceSensitive: json)
}


//MARK - Loading JSON

func loadFromLocalFile(fileName name: String, bundle: Bundle = Bundle.main) throws -> JSONArray {
    
    if let url = bundle.url(forResource:name),
        let data = try? Data(contentsOf: url),
        let maybeArray = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? JSONArray,
        let array = maybeArray{
        return array
    }else{
        throw StarWarsError.jsonParsingError
    }
}



