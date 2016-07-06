//
//  Problem3ViewController.swift
//  Assignment2
//
//  Created by Bryan Marin on 7/2/16.
//  Copyright © 2016 Bryan Marin. All rights reserved.
//

import UIKit


class Problem3ViewController: EngineViewController {
    
    
var before = [[Bool]](count: 10, repeatedValue: [Bool](count: 10, repeatedValue: false))

    @IBAction func ButtonPushed(sender: UIButton) {
        

        step(before)       
        
    }
        
    @IBOutlet weak var ResultOfCalculations: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.navigationItem.title = "Problem 3"      // Do any additional setup after loading the view.
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
