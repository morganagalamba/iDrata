//
//  kgview.swift
//  agua
//
//  Created by Morgana Beatriz on 17/08/20.
//  Copyright © 2020 Morgana Beatriz Feijo Galamba. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var textField2: UITextField!
    //var first = FirstView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func okbutton2() {
        let kg: String = textField2.text ?? "0"
        //first.user.weight = Int(kg) ?? 0
        //first.user.water = (35*Float(first.user.weight))/1000
    }
}
