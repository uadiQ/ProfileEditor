//
//  ProfileEditViewController.swift
//  ProfileEditor
//
//  Created by Vadim Shoshin on 24.10.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    @IBOutlet private weak var helloLabel: UILabel!
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var surnameField: UITextField!
    @IBOutlet private weak var fiftyYearsSwitcher: UISwitch!
    
    var delegate: EditProfileDelegate?
    var transferedName: String?
    var transferedSurname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        surnameField.delegate = self
        nameField.text = transferedName
        surnameField.text = transferedSurname
    }
    
    
    private func clearTextFields()
    {
        nameField.text = ""
        surnameField.text = ""
    }
    
    @IBAction private func fiftyYearsSwitcherChanged(_ sender: UISwitch) {
    }
    
    @IBAction private func applyButtonPressed(_ sender: UIButton) {
        let name = nameField.text ?? "Undefined"
        let surname = surnameField.text ?? "Undefined"
        if fiftyYearsSwitcher.isOn
        {
            helloLabel.text = "Hello, \(name) \(surname)"
        }
        else
        {
            helloLabel.text = "Hello, \(name)"
        }
        delegate?.userDidChange(firstName: name, lastName: surname)
        view.endEditing(true)
    }
    
    
    
    @IBAction private func resetButtonPressed(_ sender: UIButton) {
        fiftyYearsSwitcher.isOn = false
        clearTextFields()
        helloLabel.text = ""
        delegate?.userDidResetInfo()
    }
}

extension ProfileEditViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

