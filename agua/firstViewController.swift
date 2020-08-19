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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //le o que esta escrito no text field de peso
        let kg: String = textFieldKg.text  ?? "0"
        
        //transformar text em int
        user.weight = Int(kg) ?? 0
        
        //Multiplica o valor escrito por 35 e divide por 1000
        user.water = (35*Float(user.weight))/1000
            let destVc = segue.destination as! ViewController
            destVc.first = user
    }
    
    /*override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        <#code#>
    }*/
    
    @IBAction func okButton() {
        
        performSegue(withIdentifier: "qualquerNome", sender: self)
    }
    
}
