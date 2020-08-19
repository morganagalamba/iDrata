//
//  ViewController.swift
//  agua
//
//  Created by Morgana Beatriz Feijo Galamba on 02/03/20.
//  Copyright © 2020 Morgana Beatriz Feijo Galamba. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var waterPercentage: UILabel!
    @IBOutlet var waterL: UILabel!
    @IBOutlet var waterFill: UIProgressView!
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet var congratsView: UIView!
    @IBOutlet weak var changeButton: UIButton!
    //var first: UIViewController
    //var first = FirstView()
    var first: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        /*waterL.text = String(format: "%.1f",first.user.waterDrinked)+"L de "+String(format:"%.1f",first.user.water)+"L"
        waterPercentage.text = String(format: "%.0f",first.user.percentage) + "%"
        waterFill.progress = Float(first.user.percentage)/100
        kgLabel.text = String(first.user.weight)
        kgLabel.text!.append("Kg")
        if first.user.percentage == 100.0{
            print("bebeu tudo")
            //congratsView.isHidden = false
        }*/
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    /*func atualizaTela(){
        waterL.text = String(format: "%.1f",first.user.waterDrinked)+"L de "+String(format:"%.1f",first.user.water)+"L"
        waterPercentage.text = String(format: "%.0f",first.user.percentage) + "%"
        waterFill.progress = Float(first.user.percentage)/100
        kgLabel.text = String(first.user.weight)
        kgLabel.text!.append("Kg")
        if first.user.percentage == 100.0{
            congratsView.isHidden = false
        }
    }*/
    
   /* @IBAction func plusButton30ml() {
        first.user.drinked(amount: 0.03)
    }
    
    @IBAction func lessButton30ml() {
        first.user.notDrinked(amount: 0.03)
    }
    @IBAction func plusButton200ml() {
        first.user.drinked(amount: 0.2)
    }
    @IBAction func lessButton200ml() {
        first.user.notDrinked(amount: 0.2)
    }
    @IBAction func plusButton500ml() {
        first.user.drinked(amount: 0.5)
    }
    @IBAction func lessButton500ml() {
        first.user.notDrinked(amount: 0.5)

    }
     
     
    @IBAction func goBackButton() {
        first.user.waterDrinked = 0.0
        first.user.percentage = 0.0
        //congratsView.isHidden=true
    }*/
    @IBAction func plusButton30ml() {
        //print(first?.weight)
        print(first?.weight)
    }
}
