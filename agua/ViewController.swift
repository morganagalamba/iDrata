//
//  ViewController.swift
//  agua
//
//  Created by Morgana Beatriz Feijo Galamba on 02/03/20.
//  Copyright © 2020 Morgana Beatriz Feijo Galamba. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController{
    
    
    @IBOutlet var waterPercentage: UILabel!
    @IBOutlet var waterL: UILabel!
    @IBOutlet var kgLabel: UILabel!
    //@IBOutlet var waterFill: UIProgressView!
    @IBOutlet var waterFill: UIProgressView!
    
    var first: PersonClass?
    var person: [NSManagedObject] = []
    
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
        waterL.text = String(format: "%.1f",(person[0].value(forKey: "waterDrinked") as! Float))+"L de "+String(format:"%.1f",(person[0].value(forKey: "water") as! Float))+"L"
        waterPercentage.text = String(format: "%.0f",(person[0].value(forKey: "percentage") as! Float)) + "%"
        waterFill.progress = ((person[0].value(forKey: "percentage") as! Float)/100.0)
        kgLabel.text = String(person[0].value(forKey: "weight") as! Float)
        kgLabel.text!.append("Kg")
        if (person[0].value(forKey: "percentage") as! Float) == 100.0{
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
            
            self.person[0].setValue(Int(newKg), forKey: "weight")
            self.person[0].setValue((35*(self.person[0].value(forKey: "weight") as! Float)/1000), forKey: "water")
            self.atualizaTela()
          
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(changeAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func drinked(amount:Float){
        
        person[0].setValue(person[0].value(forKey: "waterDrinked") as! Float + amount, forKey: "waterDrinked")
    
        if (person[0].value(forKey: "waterDrinked") as! Float) > (person[0].value(forKey: "water") as! Float){
            person[0].setValue(person[0].value(forKey: "water") as! Float,forKey: "waterDrinked")
        }
        
        person[0].setValue(((person[0].value(forKey: "water") as! Float)*100)/(person[0].value(forKey: "water") as! Float), forKey: "percentage")
    }
    
    func notDrinked(amount:Float){
        
        person[0].setValue(person[0].value(forKey: "waterDrinked") as! Float - amount, forKey: "waterDrinked")
        
        if (person[0].value(forKey: "waterDrinked") as! Float) < 0 {
            person[0].setValue(0,forKey: "waterDrinked")
        }
        
        person[0].setValue(((person[0].value(forKey: "water") as! Float)*100)/(person[0].value(forKey: "water") as! Float), forKey: "percentage")
    }
    
    @IBAction func plusButton30ml() {
        //print(first?.weight)
        drinked(amount: 0.03)
        if (person[0].value(forKey: "percentage") as! Float) == 100.0 {
            person[0].setValue(0.0,forKey: "percentage")
            person[0].setValue(0.0,forKey: "waterDrinked")
        }
        atualizaTela()
    }
    
    @IBAction func lessButton30ml() {
        notDrinked(amount: 0.03)
    }
    
    @IBAction func plusButton200ml() {
        drinked(amount: 0.2)
        atualizaTela()
    }
    
    @IBAction func lessButton200ml() {
        notDrinked(amount: 0.2)
        atualizaTela()
    }
    
    @IBAction func plusButton500ml() {
        drinked(amount: 0.5)
        atualizaTela()
    }
    
    @IBAction func lessButton500ml() {
        notDrinked(amount: 0.5)
        atualizaTela()
    }
}
