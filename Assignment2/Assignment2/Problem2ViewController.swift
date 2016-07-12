//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Bryan Marin on 7/2/16.
//  Copyright © 2016 Bryan Marin. All rights reserved.
//






/* I tried to add some finishing touches today, July 5th before i committed,
 I don't know what I did but I've spent my entire day trying to fix the error I am getting
 "Segmentation fault: 11", I just can't figure it out and I've tried everything */
 
 
 


import UIKit

class Problem2ViewController: MainController {
    
    
    @IBAction func ButtonPushed(sender: UIButton) {
        
        
        var before = [[Bool]](count: 10, repeatedValue: [Bool](count: 10, repeatedValue: false))
        var after = [[Bool]](count: 10, repeatedValue: Array(count: 10, repeatedValue: false))
        
        // an array of an array of Bools is declared initialize to the "false" value
        
        for row in 0..<10 {
            // Ten rows will be accounted for
            for column in 0..<10 {
                // Then ten columns will be accounted for
                if arc4random_uniform(3) == 1 {
                    // And one third of both of these will be selected
                    before[row][column] = true
                    // the selected row-column values will have a bool value of true
                }
            }
        }
        
        func findCellsAlive (twoDimensionalArray:[[Bool]]) -> Int{
            var cellsalive = 0
            //initial number of living cells is 0
            for row in 0..<10 {
                for column in 0..<10 {
                    if twoDimensionalArray[row][column] == true {
                        cellsalive += 1
                        // one living cell is added for every true column-row value
                    }
                }
            }
            return cellsalive
        }
        
        var livingCellCount = findCellsAlive(before)
        var printedBeforeCount = "Before: \(livingCellCount) living cells"
        
        
        func returnNeighbors(x: Int, y: Int) -> Int
        {
            var aliveNeighbors: Int = 0;
            
            switch before[x][y]
            {
                
            //(1,1)
            case before[(x+9)%10][(y+9)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            //(1,0)
            case before[(x+9)%10][(y+0)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            //(1,9)
            case before[(x+9)%10][(y+1)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            //(0,1)
            case before[x][(y+9)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            //(0,9)
            case before[x][(y+1%10)] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            //(9,1)
            case before[(x+1)%10][(y+9)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            //(9,0)
            case before[(x+1)%10][y] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            //(9,9)
            case before[(x+1)%10][(y+1)%10] == true:
                aliveNeighbors = aliveNeighbors + 1
                
            default:
                aliveNeighbors = aliveNeighbors + 0
            }
            return aliveNeighbors
        
        
        for row in 0..<10 {
            for column in 0..<10 {
                // Account once again for columns and rows
                
                let livingNeighborCount = howManyLivingNeighbors(before, row, column)
                // this variable detects living neighbors of any cell
                
                let detectedCell: Bool = before[row][column]
                // detected cell comes from the before array
                
                switch livingNeighborCount {
                    // Switch statement to determine whether detected cell lives or dies
                    
                case 0...1:
                    after[row][column] = false
                // dies or stays dead of underpopulation
                case 2:
                    // Switch case to see if cell is living or dead
                    switch detectedCell {
                    case true:
                        after[row][column] = true
                    // if living, stays alive
                    case false:
                        after[row][column] = false
                        // if dead, stays dead
                    }
                case 3:
                    after[row][column] = true
                // cells lives if 3 neighbors are alive
                default:
                    after[row][column] = false
                    // if none of these conditions met, cell remains dead
                    
                }
                
            }
        }
        
        livingCellCount = findCellsAlive(after)
        let printedAfterCount = "After: \(livingCellCount) living cells"
        
        ResultOfCalculations.text = "\(printedBeforeCount) /n + \(printedAfterCount)"
        
        
    }
    
    
    @IBOutlet weak var ResultOfCalculations: UITextField!
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Problem 2"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}




