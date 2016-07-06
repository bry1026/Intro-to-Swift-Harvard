//
//  Problem4ViewController.swift
//  Assignment2
//
//  Created by Bryan Marin on 7/2/16.
//  Copyright © 2016 Bryan Marin. All rights reserved.
//

import UIKit

class Problem4ViewController: MainController {
    
    
    @IBAction func ButtonPushed(sender: UIButton) {
        
        var before : [[Bool]]
        
        var livingCellCount: Int
        
        var alive = false

func neighbors (row: Int, column: Int) -> [(Int,Int)] {
            
        // function will take coordinates and return array of coordinates of living neighbors
    
            for _ in before {
                
                if before[(row)%10][(column+1)%10] = true {
                    alive = true}
                // top
                
                if before[(row)%10][(column+9)%10]{
                    alive = true}
                // bottom
                
                if before[(row+1)%10][(column)%10]{
                    alive = true
                }
                // right
                
                if before[(row+9)%10][(column)%10] {
                    alive = true
                }
                // left
                
                if before[(row+1)%10][(column+1)%10] {
                    alive = true
                }
                // top right
                
                if before[(row+9)%10][(column+1)%10] {
                    alive = true
                }
                // top left
                
                if before[(row+1)%10][(column+9)%10] {
                    alive = true
                }
                // bottom right
                
                if before[(row+9)%10][(column+9)%10] {
                    alive = true
                }
                // bottom left
                
                
                return (row,column)
            }
            
        }
        
        
        @IBOutlet weak var TextField: UITextField!
        
        
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.title = "Problem 4"
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
}