//
//  EmptyTableViewCell.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var rootView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
