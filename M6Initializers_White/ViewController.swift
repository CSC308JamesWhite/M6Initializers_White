//
//  ViewController.swift
//  M6Initializers_White
//
//  Created by James White on 2/26/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var modeControl: UISegmentedControl!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBAction func resultTapped(_ sender: UIButton) {
    }
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ageField.keyboardType = .numberPad
    }
    
    //Models
    class Person{
        var name: String
        var age: Int
        
        //Designated Init
        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
        
        convenience init(){
            self.init(name: "John", age: 23)
        }
        
        convenience init(name: String){
            self.init(name: name, age: 21)
        }
        
        convenience init(name: String, age: Int){
            self.init(name: name, age: age)
        }
    }
    
    class ValidatedPerson{
        let name: String
        let age: Int
        
        inti?(name: String, age: Int){
            guard !name.isEmpty, age > 0 else { return nil }
        }
    }


}

