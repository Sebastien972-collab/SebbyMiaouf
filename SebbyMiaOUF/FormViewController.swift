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
    var dog : Pet!
    
    
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
        checkPetStatus()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccess"{
            let successVC = segue.destination as! SuccessViewController
            successVC.dog = dog

        }
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
        
         dog = Pet(name: name, hasMajority: hasMajority, phone: phoneNumber, race: race, gender: gender)
        
        
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func dissMissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        mobilNumberTextField.resignFirstResponder()
    }
    private func checkPetStatus (){
        switch dog.status {
        case .accepted:
            performSegue(withIdentifier: "segueToSuccess", sender: self)
        case .rejected(let error):
            presentAlert(with: error)
        }
    }
    private func presentAlert(with error: String){
        let alerteVC = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerteVC.addAction(action)
        present(alerteVC, animated: true, completion: nil)
    }
}
