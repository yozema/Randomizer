//
//  SettingsViewController.swift
//  Randomizer
//
//  Created by Ilya Zemskov on 10.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!
    
    var randomNumber: RandomNumber!
    unowned var delegate: SettingsViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.delegate = self
        maximumValueTF.delegate = self
        minimumValueTF.text = randomNumber.minimumValue.formatted()
        maximumValueTF.text = randomNumber.maximumValue.formatted()
    }
    
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped() {
        view.endEditing(true)
        delegate.setNewValue(for: randomNumber)
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
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



