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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: CreditCardView.self), owner: self, options: nil)
        addSubview(contentView)
        
        cardNumber.text =  "1235"
    }
    
    

}
