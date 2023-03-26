//
//  MenuViewController.swift
//  RickAndMortyAPI
//
//  Created by Aleksey Efimov on 10.03.2023.
//

import UIKit



class MenuViewController: UIViewController {
    
    private var randomCharacter: Character?
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showAllCharacter" {
            guard let allCharacterVC = segue.destination as? AllCharacterCollectionViewController else { return }
            allCharacterVC.fetchCharacter(from: link.allCharacter.rawValue)
        } else if segue.identifier == "showRandomCharacter" {
            let link = link.allCharacter.rawValue + String(Int.random(in: 1...826))
            guard let infoCharacterVC = segue.destination as? InfoCharacterViewController else { return }
            infoCharacterVC.fetchRandomCharacter(from: link)
        }
    }
}





