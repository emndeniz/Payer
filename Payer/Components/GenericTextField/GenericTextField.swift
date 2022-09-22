//
//  GenericTextField.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//

import UIKit

class GenericTextField: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: GenericTextField.self), owner: self, options: nil)
        addSubview(contentView)
    }
    
    func setData(data:GenericTextFieldData){
        textLabel.text = NSLocalizedString(data.label, comment: "")
        textField.placeholder =  NSLocalizedString(data.placeHolder, comment: "")
        textField.text =  NSLocalizedString(data.text, comment: "")
    }
    
    func getData() -> GenericTextFieldData{
        GenericTextFieldData(label: textLabel.text ?? "",
                             placeHolder: textField.placeholder ?? "",
                             text: textField.text ?? "")
    }
    
}



struct GenericTextFieldData{
    let label:String
    let placeHolder:String
    let text:String
    
    init(label:String, placeHolder:String="",text:String=""){
        self.label = label
        self.placeHolder = placeHolder
        self.text = text
    }
}
