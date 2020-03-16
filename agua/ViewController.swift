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
    @IBOutlet var waterFill: UIProgressView!
    @IBOutlet weak var kgView: UIView!
    @IBOutlet weak var textFieldKg: UITextField!
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet var textFieldKg2: UITextField!
    @IBOutlet var congratsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var user: Person = Person(kg: 0, qtdAgua: 0.0, agua: 0.0)
    
    func atualizaTela(){
        waterL.text = String(format: "%.1f",user.waterDrinked)+"L de "+String(format:"%.1f",user.water)+"L"
        waterPercentage.text = String(format: "%.0f",user.percentage) + "%"
        waterFill.progress = Float(user.percentage)/100
        kgLabel.text = String(user.weight)
        kgLabel.text!.append("Kg")
        if user.percentage == 100.0{
            congratsView.isHidden = false
        }
    }
    
    func waterAmount(){
        //le o que esta escrito no text field de peso
        let kg: String = textFieldKg.text!
        
        //transformar text em int
        user.weight = Int(kg)!
        
        //Multiplica o valor escrito por 35 e divide por 1000
        user.water = (35*Float(user.weight))/1000
        
        atualizaTela()
    }
    
    func changeKg(){
        let kg: String = textFieldKg2.text!
        user.weight = Int(kg)!
        user.water = (35*Float(user.weight))/1000
        atualizaTela()
    }
    
    
    
    @IBAction func plusButton30ml() {
        user.drinked(amount: 0.03)
        atualizaTela()
    }
    
    @IBAction func lessButton30ml() {
        user.notDrinked(amount: 0.03)
        atualizaTela()
    }
    @IBAction func plusButton200ml() {
        user.drinked(amount: 0.2)
        atualizaTela()
    }
    @IBAction func lessButton200ml() {
        user.notDrinked(amount: 0.2)
        atualizaTela()
    }
    @IBAction func plusButton500ml() {
        user.drinked(amount: 0.5)
        atualizaTela()
    }
    @IBAction func lessButton500ml() {
        user.notDrinked(amount: 0.5)
        atualizaTela()
    }
    @IBAction func changeButton() {
        waterAmount()
        blurView.isHidden = false
        greenView.isHidden = false
        
    }
    @IBAction func okButton() {
        kgView.isHidden = true
        waterAmount()
    }

    @IBAction func okButton2() {
        changeKg()
        blurView.isHidden = true
        greenView.isHidden = true
    }
    @IBAction func goBackButton() {
        user.waterDrinked = 0.0
        user.percentage = 0.0
        congratsView.isHidden=true
        waterAmount()
    }
    
    
}
