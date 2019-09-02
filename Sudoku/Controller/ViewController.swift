//
//  ViewController.swift
//  Sudoku
//
//  Created by Ivan Korsik on 8/16/19.
//  Copyright © 2019 Ivan Korsik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonGroup = [UIButton]()
    var labelNumbers = [[EditLabel]]()
    var labelOfNumber = [UILabel]()
    
    
    @IBOutlet weak var number_1_1: EditLabel!
    @IBOutlet weak var number_1_2: EditLabel!
    @IBOutlet weak var number_1_3: EditLabel!
    @IBOutlet weak var number_1_4: EditLabel!
    @IBOutlet weak var number_1_5: EditLabel!
    @IBOutlet weak var number_1_6: EditLabel!
    @IBOutlet weak var number_1_7: EditLabel!
    @IBOutlet weak var number_1_8: EditLabel!
    @IBOutlet weak var number_1_9: EditLabel!
    @IBOutlet weak var number_2_1: EditLabel!
    @IBOutlet weak var number_2_2: EditLabel!
    @IBOutlet weak var number_2_3: EditLabel!
    @IBOutlet weak var number_2_4: EditLabel!
    @IBOutlet weak var number_2_5: EditLabel!
    @IBOutlet weak var number_2_6: EditLabel!
    @IBOutlet weak var number_2_7: EditLabel!
    @IBOutlet weak var number_2_8: EditLabel!
    @IBOutlet weak var number_2_9: EditLabel!
    @IBOutlet weak var number_3_1: EditLabel!
    @IBOutlet weak var number_3_2: EditLabel!
    @IBOutlet weak var number_3_3: EditLabel!
    @IBOutlet weak var number_3_4: EditLabel!
    @IBOutlet weak var number_3_5: EditLabel!
    @IBOutlet weak var number_3_6: EditLabel!
    @IBOutlet weak var number_3_7: EditLabel!
    @IBOutlet weak var number_3_8: EditLabel!
    @IBOutlet weak var number_3_9: EditLabel!
    @IBOutlet weak var number_4_1: EditLabel!
    @IBOutlet weak var number_4_2: EditLabel!
    @IBOutlet weak var number_4_3: EditLabel!
    @IBOutlet weak var number_4_4: EditLabel!
    @IBOutlet weak var number_4_5: EditLabel!
    @IBOutlet weak var number_4_6: EditLabel!
    @IBOutlet weak var number_4_7: EditLabel!
    @IBOutlet weak var number_4_8: EditLabel!
    @IBOutlet weak var number_4_9: EditLabel!
    @IBOutlet weak var number_5_1: EditLabel!
    @IBOutlet weak var number_5_2: EditLabel!
    @IBOutlet weak var number_5_3: EditLabel!
    @IBOutlet weak var number_5_4: EditLabel!
    @IBOutlet weak var number_5_5: EditLabel!
    @IBOutlet weak var number_5_6: EditLabel!
    @IBOutlet weak var number_5_7: EditLabel!
    @IBOutlet weak var number_5_8: EditLabel!
    @IBOutlet weak var number_5_9: EditLabel!
    @IBOutlet weak var number_6_1: EditLabel!
    @IBOutlet weak var number_6_2: EditLabel!
    @IBOutlet weak var number_6_3: EditLabel!
    @IBOutlet weak var number_6_4: EditLabel!
    @IBOutlet weak var number_6_5: EditLabel!
    @IBOutlet weak var number_6_6: EditLabel!
    @IBOutlet weak var number_6_7: EditLabel!
    @IBOutlet weak var number_6_8: EditLabel!
    @IBOutlet weak var number_6_9: EditLabel!
    @IBOutlet weak var number_7_1: EditLabel!
    @IBOutlet weak var number_7_2: EditLabel!
    @IBOutlet weak var number_7_3: EditLabel!
    @IBOutlet weak var number_7_4: EditLabel!
    @IBOutlet weak var number_7_5: EditLabel!
    @IBOutlet weak var number_7_6: EditLabel!
    @IBOutlet weak var number_7_7: EditLabel!
    @IBOutlet weak var number_7_8: EditLabel!
    @IBOutlet weak var number_7_9: EditLabel!
    @IBOutlet weak var number_8_1: EditLabel!
    @IBOutlet weak var number_8_2: EditLabel!
    @IBOutlet weak var number_8_3: EditLabel!
    @IBOutlet weak var number_8_4: EditLabel!
    @IBOutlet weak var number_8_5: EditLabel!
    @IBOutlet weak var number_8_6: EditLabel!
    @IBOutlet weak var number_8_7: EditLabel!
    @IBOutlet weak var number_8_8: EditLabel!
    @IBOutlet weak var number_8_9: EditLabel!
    @IBOutlet weak var number_9_1: EditLabel!
    @IBOutlet weak var number_9_2: EditLabel!
    @IBOutlet weak var number_9_3: EditLabel!
    @IBOutlet weak var number_9_4: EditLabel!
    @IBOutlet weak var number_9_5: EditLabel!
    @IBOutlet weak var number_9_6: EditLabel!
    @IBOutlet weak var number_9_7: EditLabel!
    @IBOutlet weak var number_9_8: EditLabel!
    @IBOutlet weak var number_9_9: EditLabel!
    
    @IBOutlet weak var button_1: UIButton!
    @IBOutlet weak var button_2: UIButton!
    @IBOutlet weak var button_3: UIButton!
    @IBOutlet weak var button_4: UIButton!
    @IBOutlet weak var button_5: UIButton!
    @IBOutlet weak var button_6: UIButton!
    @IBOutlet weak var button_7: UIButton!
    @IBOutlet weak var button_8: UIButton!
    @IBOutlet weak var button_9: UIButton!
    @IBOutlet weak var button_10: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var numberOf1: UILabel!
    @IBOutlet weak var numberOf2: UILabel!
    @IBOutlet weak var numberOf3: UILabel!
    @IBOutlet weak var numberOf4: UILabel!
    @IBOutlet weak var numberOf5: UILabel!
    @IBOutlet weak var numberOf6: UILabel!
    @IBOutlet weak var numberOf7: UILabel!
    @IBOutlet weak var numberOf8: UILabel!
    @IBOutlet weak var numberOf9: UILabel!
    
    var readyTable = [[Int]]()
    let sudokuGeneration = Grid()
    let cellFunc = funcForCell()
    let alert = UIAlertController(title: "Sudoku", message: "It's win!!", preferredStyle: .alert)
    var count = 0
    var minute = 0
    
    @objc func counter() {
        count += 1
        if count < 10 {
            
            timerLabel.text = "\(minute):0\(count)"
        } else if count < 60 {
            
            timerLabel.text = "\(minute):\(count)"
        } else {
            minute += 1
            count %= 60
            timerLabel.text = "\(minute):0\(count)"
        }
        
    }
    
    override func viewDidLoad() {
        
        var time: Timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        super.viewDidLoad()
        
        labelOfNumber = [numberOf1, numberOf2, numberOf3, numberOf4, numberOf5, numberOf6, numberOf7, numberOf8, numberOf9]
        
        buttonGroup = [button_1, button_2, button_3, button_4, button_5, button_6, button_7, button_8, button_9, button_10]
        
        for button in buttonGroup {
            button.layer.cornerRadius = 25
            button.clipsToBounds = true
        }
        
        labelNumbers = [[number_1_1,number_1_2,number_1_3,number_1_4,number_1_5,number_1_6,number_1_7,number_1_8,number_1_9],[number_2_1,number_2_2,number_2_3,number_2_4,number_2_5,number_2_6,number_2_7,number_2_8,number_2_9],[number_3_1,number_3_2,number_3_3,number_3_4,number_3_5,number_3_6,number_3_7,number_3_8,number_3_9],[number_4_1,number_4_2,number_4_3,number_4_4,number_4_5,number_4_6,number_4_7,number_4_8,number_4_9],[number_5_1,number_5_2,number_5_3,number_5_4,number_5_5,number_5_6,number_5_7,number_5_8,number_5_9],[number_6_1,number_6_2,number_6_3,number_6_4,number_6_5,number_6_6,number_6_7,number_6_8,number_6_9],[number_7_1,number_7_2,number_7_3,number_7_4,number_7_5,number_7_6,number_7_7,number_7_8,number_7_9],[number_8_1,number_8_2,number_8_3,number_8_4,number_8_5,number_8_6,number_8_7,number_8_8,number_8_9],[number_9_1,number_9_2,number_9_3,number_9_4,number_9_5,number_9_6,number_9_7,number_9_8,number_9_9]]
        
        sudokuGeneration.start()
        sudokuGeneration.mixfunc()
        readyTable = sudokuGeneration.table
        sudokuGeneration.output(readyTable)
        sudokuGeneration.deleteNumberFromTable()
        
        cellFunc.copyTable(sudokuGeneration)
        cellFunc.fillTable(labelNumbers)
        cellFunc.emptyNumberCell(labelOfNumber, labelNumbers)
        cellFunc.selectCell(labelNumbers, buttonGroup)
        
        alert.addAction(UIAlertAction(title: "New Game", style: .default, handler: { action in
           
            self.sudokuGeneration.start()
            self.sudokuGeneration.mixfunc()
            self.readyTable = self.sudokuGeneration.table
            self.sudokuGeneration.output(self.readyTable)
            self.sudokuGeneration.deleteNumberFromTable()
            
            self.cellFunc.copyTable(self.sudokuGeneration)
            self.cellFunc.fillTable(self.labelNumbers)
            self.cellFunc.emptyNumberCell(self.labelOfNumber, self.labelNumbers)
            self.cellFunc.selectCell(self.labelNumbers, self.buttonGroup)
            
            self.count = 0
            self.minute = 0
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            
            //let startView = self.storyboard?.instantiateViewController(withIdentifier: "Start") as! StartViewController
           // self.navigationController?.pushViewController(startView, animated: true)
            //self.navigationController?.popToViewController(startView, animated: true)
            //self.present(startView, animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
            
        }))
        
        if cellFunc.checkTable(labelNumbers, readyTable) {
         
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func sendNumberToCell(_ sender: UIButton) {
        if sender.titleLabel?.text != "X" {
            
            cellFunc.selectCell.text = sender.titleLabel?.text
        } else {
            cellFunc.selectCell.text = ""
        }
        if cellFunc.checkTable(labelNumbers, readyTable) {
            
            self.present(alert, animated: true, completion: nil)
        }
        for button in buttonGroup {
            button.isEnabled = false
        }
        cellFunc.emptyNumberCell(labelOfNumber, labelNumbers)
    }
    
    // Do any additional setup after loading the view.
}


