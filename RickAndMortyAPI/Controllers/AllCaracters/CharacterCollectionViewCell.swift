//
//  CharacterCollectionViewCell.swift
//  RickAndMortyAPI
//
//  Created by Aleksey Efimov on 14.03.2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func prepareForReuse() {
        characterImage.image = nil
    }
    
    func configur(whith character: Character) {
        nameLabel.text = character.name
        characterImage.layer.cornerRadius = 10
        NetworkManger.shared.fetchImage(from: character.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
