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
        let nameRaw = nameField.text ?? ""
        let ageRaw = ageField.text ?? ""

        switch modeControl.selectedSegmentIndex{
            case 0://designated init
                guard !nameRaw.isEmpty, !ageRaw.isEmpty else{
                    showAlert(title: "Missing input", message: "Enter name and age.")
                    return
                }
                guard let age = Int(ageRaw) else{
                    showAlert(title: "Invalid input", message: "Age must be a number.")
                    return
                }
                let p = Person(name: nameRaw, age: ageRaw)
                resultLabel.text = "Designated -> \(p.name), \(p.age)"
            case 1://convenience init
                if nameRaw.isEmpty{
                    let p = Person()
                    resultLabel.text = "Convenience 1 -> \(p.name), \(p.age)"
                    return
                }
            case 2:
                gurad !nameRaw.isEmpty, !ageRaw.isEmpty else{
                    showAlert(title: "Missing input", message: "Enter both your name and age.")
                    return
                }
                if let vp = ValidatedPerson(name: nameRaw, age: age){
                    resultLabel.text = "Failable -> \(vp.name), \(vp.age)"
                }
            
            default:
                break
        }
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated:true)
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

