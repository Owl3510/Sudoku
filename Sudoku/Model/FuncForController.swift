//
//  FuncForController.swift
//  Sudoku
//
//  Created by Ivan Korsik on 8/27/19.
//  Copyright © 2019 Ivan Korsik. All rights reserved.
//

import UIKit

class funcForCell {
    
    var sudokuTable = Grid()
    var selectCell = EditLabel()
    
    func copyTable(_ table: Grid) {
        
        sudokuTable = table
    }
    
    func resetCell(_ labelNumbers: [[EditLabel]]) {
        
        for indexColumn in labelNumbers {
            for item in indexColumn {
                if item.backgroundColor == UIColor.init(red: 0.931, green: 0.474, blue: 0.184, alpha: 0.8) {
                    item.backgroundColor = .clear
                }
            }
        }
    }
    
    func checkForLabel(_ labelNumbers: [[EditLabel]],_ number: Int) -> Int {
        
        var countOfNumber = 9
        for indexColumn in 0..<9 {
            for indexRow in 0..<9 {
                if String(number) == labelNumbers[indexColumn][indexRow].text! {
                    
                    countOfNumber -= 1
                }
            }
        }
        return countOfNumber
    }
    
    func checkTable(_ labelNumbers: [[EditLabel]],_ answer: [[Int]]) -> Bool {
        
        for indexColumn in 0..<9 {
            for indexRow in 0..<9 {
                if String(answer[indexColumn][indexRow]) != labelNumbers[indexColumn][indexRow].text {
                    return false
                }
            }
        }
        return true
    }
    
    func selectCell(_ labelNumbers: [[EditLabel]],_ buttonGroup: [UIButton]) {
        
        for indexColumn in labelNumbers {
            for item in indexColumn {
                item.onClick = {
                    self.resetCell(labelNumbers)
                    for button in buttonGroup {
                        button.isEnabled = true
                    }
                    item.backgroundColor = UIColor.init(red: 0.931, green: 0.474, blue: 0.184, alpha: 0.8)
                    item.layer.cornerRadius = 20
                    item.clipsToBounds = true
                    self.selectCell = item
                    
                }
            }
        }
    }
    
    func emptyNumberCell(_ labelOfNumber: [UILabel],_ labelNumbers: [[EditLabel]]) {
        
        var index = 1
        for numberLabel in labelOfNumber {
            
            numberLabel.text = String(checkForLabel(labelNumbers, index))
            index += 1
        }
    }
    
    func fillTable(_ labelNumbers: [[EditLabel]]) {
        
        for indexColumn in 0..<9 {
            for indexRow in 0..<9 {
                if sudokuTable.table[indexColumn][indexRow] != 0 {
                    labelNumbers[indexColumn][indexRow].text = String(sudokuTable.table[indexColumn][indexRow])
                    labelNumbers[indexColumn][indexRow].isUserInteractionEnabled = false
                } else {
                    labelNumbers[indexColumn][indexRow].text = ""
                }
            }
        }
    }
}
