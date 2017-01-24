//
//  Errors.swift
//  StarWars
//
//  Created by Eugenio Barquín on 21/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

enum StarWarsError : Error {
    case wrongURLFormatForJSONResource
    case resourcePointedByURLNotReachable
    case wrongJASONFormat
    case nilJSONObject
    case jsonParsingError
}
