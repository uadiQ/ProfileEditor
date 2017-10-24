//
//  EditProfileDelegate.swift
//  ProfileEditor
//
//  Created by Vadim Shoshin on 24.10.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

protocol EditProfileDelegate
{
    func userDidChange(firstName: String, lastName: String)
    func userDidResetInfo()
}
