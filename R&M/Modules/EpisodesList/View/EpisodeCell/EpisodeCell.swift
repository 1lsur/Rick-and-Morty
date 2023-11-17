//
//  EpisodeCell.swift
//  R&M
//
//  Created by k on 05.11.2023.
//

//MARK: настройка ячейки с номером эпизода

import Foundation
import UIKit
import SnapKit

class EpisodeCell: UITableViewCell {
    
    var needLayout = true
    
    let episodeLabel = UILabel()
    
    func configureCell(episode: URL) {
        if needLayout {
            
            needLayout = false
            self.contentView.addSubview(episodeLabel)
            episodeLabel.snp.makeConstraints { make in
                make.left.right.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
            }
            episodeLabel.numberOfLines = 1
        }
        episodeLabel.text = episode.lastPathComponent
    }
}
