//
//  ProfileInfoViewController.swift
//  ProfileEditor
//
//  Created by Vadim Shoshin on 24.10.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

class ProfileInfoViewController: UIViewController {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var surnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditScreen", let destVC = segue.destination as? ProfileEditViewController
        {
            destVC.delegate = self
            destVC.trasnferedName = nameLabel.text
            destVC.trasnferedSurname = surnameLabel.text
        }
    }

}

extension ProfileInfoViewController: EditProfileDelegate
{
    func userDidChange(firstName: String, lastName: String) {
        nameLabel.text = firstName
        surnameLabel.text = lastName
    }
    
    func userDidResetInfo() {
        nameLabel.text = ""
        surnameLabel.text = ""
    }
}
