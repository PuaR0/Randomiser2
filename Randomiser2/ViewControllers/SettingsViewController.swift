//
//  SettingsViewController.swift
//  Randomiser2
//
//  Created by Алиага С on 23.6.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!
    
    var randomNumber: RandomNumber!
    var delegate: SettingsVCProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.text = String(randomNumber.minimumValue)
        maximumValueTF.text = String(randomNumber.maximumValue)
        minimumValueTF.delegate = self
        maximumValueTF.delegate = self
    }
    
    @IBAction func canselButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed() {
        view.endEditing(true)
        delegate.setNewValues(for: randomNumber)
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        
        if textField == minimumValueTF {
            randomNumber.minimumValue = numberValue
        } else {
            randomNumber.maximumValue = numberValue
        }
    }
}
