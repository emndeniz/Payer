//
//  PaymentTypeTableViewCell.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//

import UIKit

class PaymentTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var paymentImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
