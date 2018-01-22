//
//  Karte.swift
//  conZumUeben
//
//  Created by Kilian Erdmann on 15.01.18.
//  Copyright © 2018 Kilian Erdmann. All rights reserved.
//

import Foundation

struct Karte{
    var istOffen = false
    var istGefunden = false
    var kartenID: Int
    
    private static var IDFabrik = 0
    
    init() {
        kartenID = Karte.IDFabrik
        Karte.IDFabrik += 1
    }
    
}
