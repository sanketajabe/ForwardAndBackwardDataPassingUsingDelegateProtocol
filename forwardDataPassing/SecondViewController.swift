//
//  SecondViewController.swift
//  forwardDataPassing
//
//  Created by Apple on 02/11/22.
//

import UIKit
//Mark:- Taking Protocol To Pass Data Backward
protocol BackDataPassingProtocol{
    func passDataToFVC(textToPass : String)
}
class SecondViewController: UIViewController {

//Mark:-  Taking Label And TextField Connection On ViewController
    @IBOutlet var lableOnSVC: UILabel!
    @IBOutlet var dataTextFieldOnSVC: UITextField!
    
    var dataFromFVC : String?
    var delegateSVC : BackDataPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lableOnSVC.text = dataFromFVC
        navigationItem.hidesBackButton = true
    }
// Mark:- Btn click To pop ViewController
    @IBAction func btnOnSVC(_ sender: Any) {
        guard let delegateOnSVC = delegateSVC else{
            print("delegate not found")
            return
        }
        let nameRetrivedFromTextField = self.dataTextFieldOnSVC.text
        delegateOnSVC.passDataToFVC(textToPass: nameRetrivedFromTextField!)
        self.navigationController?.popViewController(animated: true)
    }
}
