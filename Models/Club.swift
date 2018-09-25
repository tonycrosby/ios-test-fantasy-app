//
//  Club.swift
//  FinalApp
//
//  Created by Tony Crosby on 11/29/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import Foundation

struct Club {
    
    var name: String
    var logoUrl: String
    var logoImageData: Data?
    
    init() {
        name = ""
        logoUrl = ""
        logoImageData = nil
    }
}
