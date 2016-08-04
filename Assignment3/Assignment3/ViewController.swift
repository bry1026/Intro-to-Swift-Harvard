//
//  ViewController.swift
//  Assignment3
//
//  Created by Bryan Marin on 7/9/16.
//  Copyright © 2016 Bryan Marin. All rights reserved.
//

import UIKit




class ViewController: UIViewController, EngineDelegate {
   
    @IBOutlet weak var gridView: GridView!
    @IBAction func runPressed(sender: UIButton) {
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        engineDidUpdate(StandardEngine.sharedInstance.grid)
        StandardEngine.sharedInstance.delegate = self
    }

    
    func engineDidUpdate(withGrid: GridProtocol) {
        gridView.setNeedsDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

