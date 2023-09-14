//
//  ViewController.swift
//  arrey
//
//  Created by admin on 07.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idTextFiled: UITextField!
    @IBOutlet weak var nameTextFild: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var add2Button: UIButton!
    var label: UILabel?
    var `switch`: UISwitch?
    
    var idName = [
        ["id" : "1", "name" : "Alex"],
        ["id" : "2", "name" : "Filip"],
        ["id" : "3", "name" : "Nina"],
        ["id" : "4", "name" : "Max" ],
        ["id" : "5", "name" : "Kate"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        
        let elements = getEvenElements(false)
        print(elements)
        
        let sortedIdName = alphabet(name: "name")
        print(sortedIdName)
        
        //MARK: Constraints
    }
    func setupSubviews() {
        let newLabel = UILabel()
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        newLabel.text = "label"
        newLabel.textColor = .black
        view.addSubview(newLabel)
        let label = ["newLabel" : newLabel]
        let HorConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-100-[newLabel]-100-|",
            metrics: nil,
            views: label)
        let VerConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-500-[newLabel(100)]",
            metrics: nil,
            views: label)

        NSLayoutConstraint.activate(HorConstraints)
        NSLayoutConstraint.activate(VerConstraints)
        
        addButton.layer.cornerRadius = 25
    }
    @IBAction func add2Button(_ sender: Any) {
    }
    @IBAction func newDictionaryButton(_ sender: Any) {
        guard let idText = idTextFiled.text,
              let name = nameTextFild.text,
              let id = Int(idText) else {
            return
        }
        let newDictionary = ["id" : String(id), "name" : String(name)]
        idName.append(newDictionary)
        
        let formattedOutput = "id: \(id), name: \(name)"
        
        let outputText = outputTextView.text ?? ""
        let newOutputText = "\(outputText)\n\(formattedOutput)"
        outputTextView.text = newOutputText
    }
    func getEvenElements(_ isEven: Bool) -> [[String: String]] {
        var newArray: [[String: String]] = []
        for element in idName {
            if let id = element["id"] {
                if isEvenValue(id) == isEven {
                    newArray.append(element)
                }
            }
        }
        return newArray
    }
    
    func isEvenValue(_ id: String) -> Bool {
        guard let meaning = Int(id) else {
            return false
        }
        return meaning % 2 == 0
    }
    func alphabet(name : String) -> [[String : String]] {
            return idName.sorted { ($0["name"] ?? "") > ($1["name"] ?? "") }
        }
}
       
