//
//  SolveSudoku.swift
//  Sudoku
//
//  Created by Ivan Korsik on 8/19/19.
//  Copyright © 2019 Ivan Korsik. All rights reserved.
//

import Foundation

typealias SodukuPuzzle = [[Int]]

class Soduku {
    
    func findNextCellToFill(_ table: [[Int]], _ indexColumn: Int, _ indexRow: Int) -> (Int, Int){
        
        for indexColumn in 0..<9 {
            for indexRow in 0..<9 {
                if table[indexColumn][indexRow] == 0 {
                    
                    return (indexColumn, indexRow)
                }
            }
        }
        return (-1, -1)
    }
    
    func isValid(_ table: [[Int]],_ indexColumn: Int, _ indexRow: Int, _ cell: Int) -> Bool {

        var rowOk = true
        for index in 0..<9 {
            if cell == table[indexColumn][index] {
                rowOk = false
            }
        }
        
        if rowOk {
            var columnOk = true
            for index in 0..<9 {
                if cell == table[index][indexRow] {
                    columnOk = false
                }
            }
            if columnOk {
                let secTopX = 3 * ( indexColumn / 3)
                let secTopY = 3 * ( indexRow / 3)
                for indexX in secTopX..<secTopX + 3 {
                    for indexY in secTopY..<secTopY + 3 {
                        if table[indexX][indexY] == cell {
                            return false
                        }
                    }
                }
                return true
            }
        }
        return false
    }
    
    func solverSudoku(_ table: [[Int]],_ indexColumn: Int, _ indexRow: Int) -> Bool{
        var indexColumn = indexColumn
        var indexRow = indexRow
        var table = table
        
        (indexColumn, indexRow) = findNextCellToFill(table, indexColumn, indexRow)
        
        if indexColumn == -1 {
            return true
        }
        
        for cell in 1...9 {
            if isValid(table, indexColumn, indexRow, cell) {
                table[indexColumn][indexRow] = cell
                if solverSudoku(table, indexColumn, indexRow) {
                 
                    return true
                }
            }
        }
        return false
    }
}
