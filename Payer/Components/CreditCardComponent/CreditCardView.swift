//
//  CreditCardView.swift
//  Payer
//
//  Created by Emin on 21.09.2022.
//

import UIKit

class CreditCardView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var company: UIImageView!
    
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var expDate: UILabel!
    
    @IBOutlet weak var cvvLabel: UILabel!
    
    @IBOutlet weak var cvvDate: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(model:CardUIViewModel?=nil) {
        Bundle.main.loadNibNamed(String(describing: CreditCardView.self), owner: self, options: nil)
        addSubview(contentView)
        
        
        expLabel.text = NSLocalizedString("expLabel",comment: "")
        cvvLabel.text = NSLocalizedString("cvvLabel",comment: "")
        
        guard let model = model else {
            return
        }

        
        cardNumber.text = model.cardNumber
        userName.text = model.userName
        
  
    }
    
    

}

struct CardUIViewModel {
    let userName: String
    let cardNumber: String
    let cvc: String
    let expDate: String
    let vendor: String
}

enum CardVendors: String {
    case masterCard
    case visa
}
