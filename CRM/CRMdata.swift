//
//  CRMdata.swift
//  CRM
//
//  Created by Roy Berner on 05/01/2018.
//  Copyright © 2018 Roy Berner. All rights reserved.
//

import Foundation

struct Opleiding:Decodable {
    let naam_opleiding: String?
    let zoeknaam_opleiding: String?
    let opleiding_id: String?
    let begin_datum: String?
    let eind_datum: String?
    let prijs: String?
}
