//
//  ViewController.swift
//  agua
//
//  Created by Morgana Beatriz Feijo Galamba on 02/03/20.
//  Copyright © 2020 Morgana Beatriz Feijo Galamba. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet var waterPercentage: UILabel!
    @IBOutlet var waterL: UILabel!
    @IBOutlet var kgLabel: UILabel!
    //@IBOutlet var waterFill: UIProgressView!
    @IBOutlet var waterFill: UIProgressView!
    
    var first: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        if first?.canFresh == true {
            atualizaTela()
        }
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func atualizaTela(){
        waterL.text = String(format: "%.1f",first!.waterDrinked)+"L de "+String(format:"%.1f",first!.water)+"L"
        waterPercentage.text = String(format: "%.0f",first!.percentage) + "%"
        waterFill.progress = Float(first!.percentage)/100
        kgLabel.text = String(first!.weight)
        kgLabel.text!.append("Kg")
        if first?.percentage == 100.0{
            print("bebeu tudo")
        }
    }
    @IBAction func changeButton() {
        let alert = UIAlertController(title: "Novo peso",
                                      message: "Qual o seu peso atual?",
                                      preferredStyle: .alert)
        
        let changeAction = UIAlertAction(title: "Mudar",
                                       style: .default) {
          [unowned self] action in
                                        
          guard let textField = alert.textFields?.first,
            let newKg = textField.text else {
              return
          }
          
            self.first?.weight = Int(newKg)!
            self.first?.water = (35*Float(self.first!.weight))/1000
            self.atualizaTela()
          
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(changeAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func plusButton30ml() {
        //print(first?.weight)
        first!.drinked(amount: 0.03)
        atualizaTela()
    }
    
    @IBAction func lessButton30ml() {
        first!.notDrinked(amount: 0.03)
    }
    
    @IBAction func plusButton200ml() {
        first!.drinked(amount: 0.2)
        atualizaTela()
    }
    
    @IBAction func lessButton200ml() {
        first!.notDrinked(amount: 0.2)
        atualizaTela()
    }
    
    @IBAction func plusButton500ml() {
        first!.drinked(amount: 0.5)
        atualizaTela()
    }
    
    @IBAction func lessButton500ml() {
        first!.notDrinked(amount: 0.5)
        atualizaTela()
    }
}
