//
//  RatingsViewController.swift
//  TipTap
//
//  Created by sriram on 09/11/23.
//

import UIKit

class RatingsViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backView.layer.cornerRadius = 10
         
    }
    

    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
