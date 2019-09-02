//
//  UISudokuDrawView.swift
//  Sudoku
//
//  Created by Ivan Korsik on 8/16/19.
//  Copyright © 2019 Ivan Korsik. All rights reserved.
//

import UIKit

@IBDesignable
class UISudokuDrawView: UIView {

    
    private var height: CGFloat {
        
        return min(bounds.size.width, bounds.size.height)
    }
    
    private var squareBorder: CGFloat {
        
        return height / 9
    }
    
    private var endSquareBorder: CGPoint {
        
        return CGPoint(x: squareBorder, y: squareBorder)
    }
    
    private func pathForSquare(_ indexX: Int, _ indexY: Int) -> UIBezierPath {
        
        let pathSquare = CGRect(x: bounds.minX + CGFloat(indexX * Int( endSquareBorder.x)), y: bounds.minY + CGFloat(indexY * Int(endSquareBorder.y)), width: endSquareBorder.x, height: endSquareBorder.y)
        
        let squarePath = UIBezierPath(rect: pathSquare)
        squarePath.lineWidth = 2.0
        return squarePath
    }
    
    private func pathForLineX(_ indexY: Int) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.lineWidth = 4.0
        path.move(to: CGPoint(x: CGFloat(indexY * Int(endSquareBorder.x)), y: 0))
        path.addLine(to: CGPoint(x: CGFloat(indexY * Int(endSquareBorder.x)), y: (9 * endSquareBorder.y) - 4))
        
        return path
    }
    
    private func pathForLineY(_ indexY: Int) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.lineWidth = 4.0
        path.move(to: CGPoint(x: 0, y: CGFloat(indexY * Int(endSquareBorder.x))))
        path.addLine(to: CGPoint(x: (9 * endSquareBorder.y) - 4, y: CGFloat(indexY * Int(endSquareBorder.x))))
        
        return path
    }
    // + CGFloat(index * Int( endSquareBorder.x))
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        for itemY in 0..<9 {
            for itemX in 0..<9 {
                
                let path = pathForSquare(itemX, itemY)
                
                var color = UIColor.init(red: 0.931, green: 0.474, blue: 0.184, alpha: 0.3)
                color.setStroke()
                
                path.stroke()
                if itemY == 3 || itemY == 6{
                    color = UIColor.init(red: 0.931, green: 0.474, blue: 0.184, alpha: 1.0)
                    color.setStroke()
                    pathForLineX(itemY).stroke()
                    pathForLineY(itemY).stroke()
                }
            }
        }
    }
    
 

}
