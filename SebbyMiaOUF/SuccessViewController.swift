//
//  SuccessViewController.swift
//  SebbyMiaOUF
//
//  Created by DAGUIN Sébastien on 09/12/2020.
//

import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var messageBienvenue: UILabel!
    var dog : Pet!
    @IBAction func dissmiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        // Do any additional setup after loading the view.
    }
    private func setTable() {
        if let name = dog.name{
            messageBienvenue.text = "Bienvenue " + name
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
