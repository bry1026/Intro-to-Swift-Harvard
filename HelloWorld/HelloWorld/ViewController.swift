//
//  ViewController.swift
//  HelloWorld
//
//  Created by Bryan Marin on 6/20/16.
//  Copyright © 2016 Bryan Marin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
\
    
    
    
    
    
    override func drawRect(rect: CGRect)
    {
        let width = bounds.width/CGFloat(rows)
        let height = bounds.height/CGFloat(cols)
        for (r, element) in grid.enumerate(){
            for (c, element1) in element.enumerate(){
                let cellRect: CGRect = CGRect(
                    x: (width * CGFloat(r)),
                    y: (height * CGFloat(c)),
                    width: width,
                    height: height)
                switch element1{
                case .Living:
                    let cell = UIBezierPath(ovalInRect: cellRect)
                    livingColor.setFill()
                    cell.fill()
                case .Died:
                    let cell = UIBezierPath(ovalInRect: cellRect)
                    diedColor.setFill()
                    cell.fill()
                case .Born:
                    let cell = UIBezierPath(ovalInRect: cellRect)
                    bornColor.setFill()
                    cell.fill()
                case .Empty:
                    let cell = UIBezierPath(ovalInRect: cellRect)
                    emptyColor.setFill()
                    cell.fill()
                }
                
            }
        }
    
        for x in 0...rows
        {
            let lineWidth: CGFloat = gridWidth
            let plusHeight: CGFloat = bounds.height
            let plusWidth: CGFloat = bounds.width
            
            let plusPath = UIBezierPath()
            
            plusPath.lineWidth = lineWidth
            
            plusPath.moveToPoint(CGPoint(
                x:(bounds.width/CGFloat(rows)) * CGFloat(x),
                y:bounds.height/2 - plusHeight/2))
            
            plusPath.addLineToPoint(CGPoint(
                x:(bounds.width/CGFloat(rows)) * CGFloat(x),
                y:bounds.height/2 + plusHeight/2))
            
            plusPath.moveToPoint(CGPoint(
                x:bounds.width/2  - plusWidth/2,
                y:(bounds.height/CGFloat(cols)) * CGFloat(x)))
            
            plusPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + plusWidth/2,
                y:(bounds.height/CGFloat(cols)) * CGFloat(x)))
            
            gridColor.setStroke()
            
            plusPath.stroke()
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let cellWidth = bounds.width / CGFloat (cols)
        let cellHeight = bounds.height / CGFloat (rows)
        for touch in touches {
            let point = touch.locationInView(self)
            let row = Int (point.y / cellHeight)
            let col = Int (point.x / cellWidth)
            let currentCellState = grid[row][col]
            grid[row][col] = currentCellState.toggle(currentCellState)
            self.setNeedsDisplayInRect(CGRect(x:cellWidth * CGFloat(col) + gridWidth/2, y:cellHeight * CGFloat(row) + gridWidth/2, width:cellWidth - gridWidth, height:cellHeight - gridWidth))
        }
    
    
    
}

