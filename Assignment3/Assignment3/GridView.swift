//
//  GridView.swift
//  Assignment3
//
//  Created by Bryan Marin on 7/9/16.
//  Copyright © 2016 Bryan Marin. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    @IBInspectable var rows: Int = 20{
        didSet{
            reset = true
            resetGrid()
        }
    }
    @IBInspectable var cols: Int = 20{
        didSet{
            reset = true
            resetGrid()
        }
    }
    
    var reset = Bool()
    var grid = [[CellState]]()
    
    func resetGrid() {
        if reset == true {
            return grid = [[CellState]](count:cols, repeatedValue: [CellState](count: rows, repeatedValue: .Empty))
        }
    }
    
    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var diedColor: UIColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.6)
    @IBInspectable var bornColor: UIColor = UIColor.greenColor().colorWithAlphaComponent(0.6)
    @IBInspectable var gridWidth: CGFloat = 2.0
    @IBInspectable var gridColor: UIColor = UIColor.blackColor()
    
    
   
    
    
    
    enum CellState: String {
        case Living = "Living"
        case Empty = "Empty"
        case Born = "Born"
        case Died = "Died"
        
        func description() -> String {
            
            switch self{
                
            case .Living:
                return Living.rawValue
                
            case .Empty:
                return Empty.rawValue
                
            case .Born:
                return Born.rawValue
                
            case .Died:
                return Died.rawValue
                
                
            }
        }
        
        func allValues() -> [String]{
            return [Living.description(), Empty.description(), Born.description(), Died.description()]
        }
        
        mutating func toggle(value:CellState) -> CellState {
            switch self{
            case .Empty: Living
            case .Died: Living
            case .Living: Empty
            case .Born: Empty
            }
            return self
        }
        
        
    }
    
    
    override func drawRect(rect: CGRect) {
        let CGrows =  CGFloat(rows)
        let CGcols = CGFloat(cols)
        let width = bounds.width/CGrows
        let height = bounds.height/CGcols
        var gridBox: CGRect
        
        
        
        for row in 0...Int(rows){
            let horizontalGridLine = UIBezierPath()
            horizontalGridLine.lineWidth = gridWidth
            
            horizontalGridLine.moveToPoint(CGPoint(
                x:(bounds.width/CGFloat(rows)) * CGFloat(row),
                y:bounds.height/2 - bounds.height/2))
            
            horizontalGridLine.addLineToPoint(CGPoint(
                x:(bounds.width/CGFloat(rows)) * CGFloat(row),
                y:bounds.height/2 + bounds.height/2))

            gridColor.setStroke()
            horizontalGridLine.stroke()
        }
        
        
        for col in 0...Int(cols){
            let verticalGridLine = UIBezierPath()
            verticalGridLine.lineWidth = gridWidth
            
            verticalGridLine.moveToPoint(CGPoint(
                x:bounds.width/2  - bounds.width/2,
                y:(bounds.height/CGFloat(cols)) * CGFloat(col)))
            
            verticalGridLine.addLineToPoint(CGPoint(
                x:bounds.width/2 + bounds.width/2,
                y:(bounds.height/CGFloat(cols)) * CGFloat(col)))
            
            gridColor.setStroke()
            verticalGridLine.stroke()
        }
        
        
        for (row, state) in grid.enumerate(){
            for (col, cellObject) in state.enumerate(){
                gridBox = CGRect(
                    x: (CGFloat(row) * CGFloat(width)),
                    y: (CGFloat(col) * CGFloat(height)),
                    width: CGFloat(width),
                    height: CGFloat(height))
                switch cellObject{
                case .Living:
                    let cell = UIBezierPath(ovalInRect: gridBox)
                    livingColor.setFill(); cell.fill()
                    
                case .Empty:
                    let cell = UIBezierPath(ovalInRect: gridBox)
                    emptyColor.setFill(); cell.fill()
                    
                case .Died:
                    let cell = UIBezierPath(ovalInRect: gridBox)
                    diedColor.setFill(); cell.fill()
                    
                case .Born:
                    let cell = UIBezierPath(ovalInRect: gridBox)
                    bornColor.setFill(); cell.fill()
                    
                }
            }
        }
        
    }
    
    
    
            
        override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let cellWidth = bounds.width / CGFloat (cols)
        let cellHeight = bounds.height / CGFloat (rows)
        
        for i in touches {
            let row = i.locationInView(self).y / CGFloat(cellHeight)
            let col = i.locationInView(self).x / CGFloat(cellWidth)
            
            var stateOfCell = grid[Int(row)][Int(col)]
            grid[Int(row)][Int(col)] = stateOfCell.toggle(stateOfCell)
            
                    }
    }
    

    
    
    

    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
}