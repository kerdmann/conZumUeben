//
//  Concentration.swift
//  conZumUeben
//
//  Created by Kilian Erdmann on 15.01.18.
//  Copyright © 2018 Kilian Erdmann. All rights reserved.
//

import Foundation


class Concentration {
    private(set) var KartenPassendZuButtons = [Karte]()
    var offeneKarte: Int?
    
    
    init (AnzahlButtons AnzahlKarten: Int){
        for index in 0 ..< AnzahlKarten/2 {
            let eineKarte = Karte()
            //KartenPassendZuButtons.append(eineKarte)
            //KartenPassendZuButtons.append(eineKarte)
            KartenPassendZuButtons.insert(eineKarte, at: Int(arc4random_uniform(UInt32(2*index))))
            KartenPassendZuButtons.insert(eineKarte, at: Int(arc4random_uniform(UInt32(2*index+1))))
        }
    }
    
    func karteUmdrehen(Kartennumer positionAktuelleKarte: Int){
        if !(KartenPassendZuButtons[positionAktuelleKarte].istGefunden){
            if !(positionAktuelleKarte == offeneKarte) {
                if offeneKarte == nil {
                    for index in KartenPassendZuButtons.indices {
                        KartenPassendZuButtons[index].istOffen = false
                    }
                    offeneKarte = positionAktuelleKarte
                } else{
                    if KartenPassendZuButtons[offeneKarte!].kartenID == KartenPassendZuButtons[positionAktuelleKarte].kartenID {
                        KartenPassendZuButtons[positionAktuelleKarte].istGefunden = true
                        KartenPassendZuButtons[offeneKarte!].istGefunden = true
                        
                    }
                    offeneKarte = nil
                }
                KartenPassendZuButtons[positionAktuelleKarte].istOffen = true
                
            }
        }
    }
    
    
}
