//
//  FormViewController.swift
//  SebbyMiaOUF
//
//  Created by DAGUIN Sébastien on 09/12/2020.
//

import UIKit

class FormViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobilNumberTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var reacePickerView: UIPickerView!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }
    @IBAction func validadeButton() {
        createObject()
    }
    
    private func createObject (){
        let name = nameTextField.text
        let phoneNumber = mobilNumberTextField.text
        let hasMajority = majoritySwitch.isOn
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        var gender: Pet.Gender
        if genderIndex == 0{
            gender = .male
        }
        else{
            gender = .female
        }
        let raceIndex = reacePickerView.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        
        let dog = Pet(name: name, hasMajority: hasMajority, phone: phoneNumber, race: race, gender: gender)
        
        
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func dissMissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        mobilNumberTextField.resignFirstResponder()
    }
}
