//
//  StartViewController.swift
//  Sudoku
//
//  Created by Ivan Korsik on 8/21/19.
//  Copyright © 2019 Ivan Korsik. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {


    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    var buttonArr = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonArr.append(startButton)
        buttonArr.append(continueButton)
        for button in buttonArr {
         
            button.layer.cornerRadius = 20
            button.clipsToBounds = true
        }
        // Do any additional setup after loading the view.
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
