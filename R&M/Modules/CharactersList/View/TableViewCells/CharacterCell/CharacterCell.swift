//
//  CharacterCell.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import UIKit
import SnapKit
import SDWebImage

//MARK: настройка ячейки персонажа

class CharacterCell: UITableViewCell {
    
    var needLayout = true
    
    let characterImageView = UIImageView()
    let characterNameLabel = UILabel()
    let characterGenderLabel = UILabel()
    let characterStatusLabel = UILabel()
    
    func configureCell(character: Character) {
        
        if needLayout {
    
            needLayout = false
            self.contentView.addSubview(characterImageView)
            self.contentView.addSubview(characterNameLabel)
            self.contentView.addSubview(characterGenderLabel)
            self.contentView.addSubview(characterStatusLabel)
            
            characterImageView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().inset(16)
                make.size.equalTo(80)
            }
            characterNameLabel.snp.makeConstraints { make in
                make.left.equalTo(characterImageView.snp.right).offset(16)
                make.top.equalToSuperview().inset(8)
                make.right.equalToSuperview().inset(16)
            }
            characterGenderLabel.snp.makeConstraints { make in
                make.left.equalTo(characterImageView.snp.right).offset(16)
                make.top.equalTo(characterNameLabel.snp.bottom).offset(8)
                make.right.equalToSuperview().inset(16)
            }
            characterStatusLabel.snp.makeConstraints { make in
                make.left.equalTo(characterImageView.snp.right).offset(16)
                make.top.equalTo(characterGenderLabel.snp.bottom).offset(8)
                make.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(8)
            }
            
            self.accessoryType = .disclosureIndicator
            self.selectionStyle = .none
            
        }
        characterImageView.sd_setImage(with: character.image)
        characterNameLabel.text = character.name
        characterGenderLabel.text = character.gender.rawValue
        characterStatusLabel.text = character.status.rawValue
    }
}
