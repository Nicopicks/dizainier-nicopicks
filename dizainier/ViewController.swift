//
//  ViewController.swift
//  dizainier
//
//  Created by Nicolas on 19/01/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var chiffreUnite: UISegmentedControl!
    @IBOutlet weak var chiffreDizaine: UISegmentedControl!
    @IBOutlet weak var numberLabel: UILabel!
    var debutChiffre = 5
    var finChiffre = 0
    var geekMode = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func actionSlider(_ sender: UISlider) {
        let chiffre1 = (Int(sender.value)) / 10
        let chiffre2 = (Int(sender.value)) % 10
        creerText(chiffre1, chiffre2)
    }
    @IBAction func dizaineAction(_ sender: UISegmentedControl) {
        finChiffre = sender.selectedSegmentIndex
        creerText(debutChiffre, finChiffre)
    }
    @IBAction func centaineAction(_ sender: UISegmentedControl) {
        debutChiffre = sender.selectedSegmentIndex
        creerText(debutChiffre, finChiffre)
        
    }
    
    func creerText(_ chiffre1: Int, _ chiffre2: Int){
        numberLabel.text = "\((chiffre1))" + "\(chiffre2)"
        stepper.value = Double(numberLabel.text!)!
        chiffreDizaine.selectedSegmentIndex = (Int(numberLabel.text!)! / 10)
        chiffreUnite.selectedSegmentIndex = (Int(numberLabel.text!)! % 10)
        slider.value = Float(numberLabel.text!)!
        color42()
        guard geekMode else {return}
        let chiffre = String(Int(numberLabel.text!)!, radix: 16)
        numberLabel.text = "\(chiffre)"
        color42()
        
    }
    @IBAction func geekMode(_ sender: UISwitch) {
        guard sender.isOn else {
            geekMode = false
            return
        }
        geekMode = true
    }
    
    @IBAction func step(_ sender: UIStepper) {
        let chiffre1 = (Int(sender.value)) / 10
        let chiffre2 = (Int(sender.value)) % 10
        creerText(chiffre1, chiffre2)
    }
    
    @IBAction func raz(_ sender: UIButton) {
        creerText(5, 0)
    }
    func color42(){
        if Int(numberLabel.text!) == 42 {
            numberLabel.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        }else {
            numberLabel.textColor = UIColor.black
        }
    }
}

