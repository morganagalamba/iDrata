//
//  firstView.swift
//  agua
//
//  Created by Morgana Beatriz on 18/08/20.
//  Copyright © 2020 Morgana Beatriz Feijo Galamba. All rights reserved.
//

import UIKit
import CoreData

class FirstView: ViewController {
    
    @IBOutlet var textFieldKg: UITextField!
    
    var user = PersonClass()
    var personCoreData: [NSManagedObject] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        if defaults.bool(forKey: "First Launch") == true {
            print("segunda")

            defaults.set(true,forKey: "First Launch")
        }
        else {
            print("primeira")
            defaults.set(true,forKey: "First Launch")
            

        }
        view.addGestureRecognizer(tap)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //le o que esta escrito no text field de peso
        let kg: String = textFieldKg.text  ?? "0"
        //transformar text em int
        user.weight = Int(kg) ?? 0
        print(user.weight)
        user.canFresh = true
        user.water = (35*Float(user.weight))/1000

        //Multiplica o valor escrito por 35 e divide por 1000
        self.save(weight: user.weight, percentage: user.percentage, water: user.water, waterDrinked: user.waterDrinked)
        
                let destVc = segue.destination as! ViewController
        destVc.first = user
        destVc.person = personCoreData
    }
    
      override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      //1
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
      }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      
      //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
      
      //3
      do {
        personCoreData = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }
    
    func save(weight: Int, percentage: Float, water: Float, waterDrinked: Float) {
      
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      // 1
      let managedContext = appDelegate.persistentContainer.viewContext
      
      // 2
      let entity = NSEntityDescription.entity(forEntityName: "User",in: managedContext)!
      
      let person = NSManagedObject(entity: entity,insertInto: managedContext)
      
      // 3
      person.setValue(weight, forKeyPath: "weight")
      person.setValue(percentage, forKeyPath: "percentage")
      person.setValue(water, forKeyPath: "water")
      person.setValue(waterDrinked, forKeyPath: "waterDrinked")
    
      // 4
      do {
        try managedContext.save()
        personCoreData.append(person)
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }
    
    /*override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        <#code#>
    }*/
    
    
    @IBAction func okButton() {
        
        performSegue(withIdentifier: "qualquerNome", sender: self)
    }
    
}
