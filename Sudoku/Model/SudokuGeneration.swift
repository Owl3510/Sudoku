//
//  SudokuGeneration.swift
//  Sudoku
//
//  Created by Ivan Korsik on 8/19/19.
//  Copyright © 2019 Ivan Korsik. All rights reserved.
//

import Foundation

class Grid {
    
    var table = [[Int]]()
    let n = 3
    
    func start() {
        
        for i in 0..<n*n {
            var y = [Int]()
            for j in 0..<n*n {
                
                let x = ((i*n + i/n + j) % (n*n) + 1)
                y.append(x)
            }
            
            table.append(y)
        }
    }
    
    func output(_ table: [[Int]]) {
        for index in 0..<9 {
            print(table[index])
        }
        print("")
    }
    
    func transposing() {
        
        for indexRow in 0..<n*n {
            
            let temp = table[indexRow]
            
            for indexColumn in indexRow..<n*n {
                
                table[indexRow][indexColumn] = table[indexColumn][indexRow]
                table[indexColumn][indexRow] = temp[indexColumn]
            }
        }
    }
    
    func swapTwoSmallRows() {
        
        let area = Int.random(in: 0..<n)
        let line1 = Int.random(in: 0..<n)
        var line2 = Int.random(in: 0..<n)
        
        while line1 == line2 {
            line2 = Int.random(in: 0..<n)
        }
        
        let row1 = area*n + line1
        let row2 = area*n + line2
        table.swapAt(row1, row2)
        //table.insert(table.remove(at: row1), at: row2)
        //output()
    }
    
    func swapTwoSmallColumns() {
        
        transposing()
        swapTwoSmallRows()
        transposing()
    }
    
    func swapRowsArea() {
        
        let area1 = Int.random(in: 0..<n)
        var area2 = Int.random(in: 0..<n)
        
        while area1 == area2 {
            
            area2 = Int.random(in: 0..<n)
        }
        
        for index  in 0..<n {
            
            let line1 = area1 * n + index
            let line2 = area2 * n + index
            table.swapAt(line1, line2)
            //table.insert(table.remove(at: line1), at: line2)
            //output()
        }
    }
    
    func swapColumnsArea() {
        
        transposing()
        swapRowsArea()
        transposing()
    }
    
    func mixfunc() {

        for _ in 0..<20 {
            
            let randomValue = Int.random(in: 0...4)
            
            switch randomValue{
            case 0 :
                transposing()
            case 1 :
                swapTwoSmallRows()
            case 2 :
                swapTwoSmallColumns()
            case 3 :
                swapRowsArea()
            default :
                swapColumnsArea()
            }
        }
    }
    
    func deleteNumberFromTable() {
        
        var forLook = [[Int]]()
        
        for i in 0..<n*n {
            var y = [Int]()
            for j in 0..<n*n {
                
                let x = 0
                y.append(x)
            }
            
            forLook.append(y)
        }
        
        var iteration = 0
        var difficult = pow(Double(n), 4)
        
        while iteration <  Int(pow(Double(n), 4)) {
            let indexColumn = Int.random(in: 0..<n*n)
            let indexRow = Int.random(in: 0..<n*n)
            if forLook[indexColumn][indexRow] == 0 {
                
                iteration += 1
                forLook[indexColumn][indexRow] = 1
                
                let temp = table[indexColumn][indexRow]
                table[indexColumn][indexRow] = 0
                difficult -= 1
                
                var tableSolution = [[Int]]()
                for index in 0..<n*n {
                    
                    tableSolution.append(table[index])
                }
                let somef = Soduku()
                if !somef.solverSudoku(table, 0, 0) {
                    table[indexColumn][indexRow] = temp
                } else if difficult <= 50 {
                    iteration = 100
                }
                // print(table)
            }
            
            
        }
        
    }
}
