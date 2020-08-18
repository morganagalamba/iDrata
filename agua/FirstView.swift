//
//  firstView.swift
//  agua
//
//  Created by Morgana Beatriz on 18/08/20.
//  Copyright © 2020 Morgana Beatriz Feijo Galamba. All rights reserved.
//

import UIKit

class FirstView: ViewController {
    
    @IBOutlet var textFieldKg: UITextField!
    var user = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }
    
    @IBAction func okButton() {
        
    }
    
}
