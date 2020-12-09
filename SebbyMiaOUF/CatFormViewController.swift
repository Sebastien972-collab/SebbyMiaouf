//
//  CatFormViewController.swift
//  SebbyMiaOUF
//
//  Created by DAGUIN Sébastien on 09/12/2020.
//

import UIKit

class CatFormViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        catRaces.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        catRaces[row]
    }

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegmentControle: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var racePickerView: UIPickerView!
    
    
    @IBAction func validateButton() {
        createObject()
    }
    private func createObject (){
        let name = nameTextField.text
        let phoneNumber = mobileNumber.text
        let hasMajority = majoritySwitch.isOn
        let genderIndex = genderSegmentControle.selectedSegmentIndex
        var gender: Pet.Gender
        if genderIndex == 0{
            gender = .male
        }
        else{
            gender = .female
        }
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = catRaces[raceIndex]
        
        let cat = Pet(name: name, hasMajority: hasMajority, phone: phoneNumber, race: race, gender: gender)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dissmissKeyboard(_ sender: Any) {
        nameTextField.resignFirstResponder()
        mobileNumber.resignFirstResponder()
    }
}
    
