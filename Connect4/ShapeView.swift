//
//  ShapeView.swift
//  Connect4
//
//  Created by Karthik, Sooraj K on 12/19/18.
//  Copyright © 2018 Karthik, Sooraj. All rights reserved.
//

import UIKit


    
class ShapeView: UIView {
    
    var currentShapeType: Int = 1
    init(frame: CGRect, shape: Int) {
        super.init(frame: frame)
        self.currentShapeType = shape
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        drawRectangle()
    }
    
    
    func drawRectangle() {
        
        let rectangleWidth:CGFloat = 100.0
        let rectangleHeight:CGFloat = 100.0
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        //4
        
        
        
        
        ctx.fillPath()
    }

}
