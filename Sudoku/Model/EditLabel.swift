//
//  EditLabel.swift
//  Sudoku
//
//  Created by Ivan Korsik on 8/16/19.
//  Copyright © 2019 Ivan Korsik. All rights reserved.
//

import UIKit

@IBDesignable class EditLabel: UILabel {

    var onClick: () -> Void = {}
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        onClick()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
