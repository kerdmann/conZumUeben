//
//  ViewController.swift
//  conZumUeben
//
//  Created by Kilian Erdmann on 15.01.18.
//  Copyright © 2018 Kilian Erdmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let emojis = ["🤲","👏","✌️","🤛","👇","✋","🤟"]
    private let Spiel = Concentration(AnzahlButtons: 12)
    private(set) var Versuche = 0 {
        didSet{
            anzeige.text = "Versuche: \((Versuche+1)/2)"
        }
    }
    @IBOutlet private var Buttons: [UIButton]!
    
    @IBOutlet private weak var anzeige: UILabel!
    @IBAction private func cardTouched(_ sender: UIButton) {
        print (Buttons.index(of: sender) ?? "nicht definiert")
        Versuche += 1
        Spiel.karteUmdrehen(Kartennumer: Buttons.index(of: sender) ?? 0)
        kartenAnzeigen()
    }
    private func kartenAnzeigen(){
        for index in Buttons.indices{
            if Spiel.KartenPassendZuButtons[index].istOffen {
                Buttons[index].backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                Buttons[index].setTitle(emojis[Spiel.KartenPassendZuButtons[index].kartenID], for: UIControlState.normal)
            } else {
                if Spiel.KartenPassendZuButtons[index].istGefunden {
                    Buttons[index].backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 0)
                    Buttons[index].setTitle("", for: UIControlState.normal)
                } else {
                    Buttons[index].backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
                    Buttons[index].setTitle("😼", for: UIControlState.normal)
                }
            
            }
            
            
        }
    }

}

