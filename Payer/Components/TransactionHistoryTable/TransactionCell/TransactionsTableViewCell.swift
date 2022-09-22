//
//  TransactionsTableViewCell.swift
//  Payer
//
//  Created by Emin on 21.09.2022.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var transactionImage: UIImageView!
    @IBOutlet weak var amount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(item:TransactionItem){
        title.text = NSLocalizedString(item.title ?? "", comment: "")
        descriptionLabel.text = NSLocalizedString(item.to ?? "", comment: "")
        
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.currencyCode = "EUR"
        formatter.numberStyle = .currency
        
        let amountStr = formatter.string(for: item.amount) ?? "0"
        amount.text = amountStr
    }
}
