//
//  ViewController.swift
//  forwardDataPassing
//
//  Created by Apple on 02/11/22.
//

import UIKit

class ViewController: UIViewController,BackDataPassingProtocol {

//Mark :- Taking Label And TextField Connection On ViewController
    @IBOutlet var DataTextFieldOnFirstViewController: UITextField!
    @IBOutlet var nameLabelOnFVC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataTextFieldOnFirstViewController.text = ""
    }
//Mark :- Btn Click To Move To SecondViewController
    @IBAction func btnClicktoToNavigateToSVC(_ sender: Any) {
        
//Mark :- Creating instance of SecondViewController
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
//Mark:- Store value Of TextField In One Variable
        let dataToBePassed = self.DataTextFieldOnFirstViewController.text
        secondViewController.dataFromFVC = dataToBePassed
        
        secondViewController.delegateSVC = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
//Mark :- Back Data Passing function
    func passDataToFVC(textToPass: String) {
        self.nameLabelOnFVC.text = textToPass
    }
}

