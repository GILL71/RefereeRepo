//
//  FighterController.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 17.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import UIKit

class FighterController: UITableViewController, UITextFieldDelegate {
    
    var fighter: Fighter?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var fightsField: UITextField!
    @IBOutlet weak var winsField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        
    }
    @IBAction func okButtonAction(_ sender: Any) {
        let fighter = Fighter(name: nameField.text!, age: ageField.text!, height: heightField.text!, weight: weightField.text!, fights: fightsField.text!, wins: winsField.text!)
        self.fighter = fighter
    }
}
