//
//  PokyTableViewCell.swift
//  PockemoncARDS
//
//  Created by elina.peiseniece on 26/08/2021.
//

import UIKit

class PokyTableViewCell: UITableViewCell {

    @IBOutlet weak var pokyImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var superTypeLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var subtypeLabel: UILabel!
    
    
    func setupUI(with: Pokemon){
        nameLabel.text = " Name:" + with.name
        hpLabel.text = "Card calue: " + with.number
        
        ImageController.getImage(for: with.image) { image in
            self.pokyImageView.image = image
        }
        
        if let subtype = with.subtype {
            subtypeLabel.text = "Card: " + subtype
        }
        
        if let supertype = with.supertype{
            superTypeLabel.text = "Type: " + supertype
        
            if with.supertype == "Trainer" {
                contentView.backgroundColor = .blue
            }else{
                contentView.backgroundColor = .systemYellow
            }
        }
        
    }
}
