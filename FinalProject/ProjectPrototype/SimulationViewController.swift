
import UIKit

class SimulationViewController: UIViewController, EngineDelegate {
    
    let engine = StandardEngine.sharedInstance
    
    @IBOutlet weak var newConfigurationTextField: UITextField!
    
    
    
    @IBAction func resetPressed(sender:AnyObject){
        gridView.points = []
        engine.buttonClicks = 1
        runButton.setTitle("Run 1 Cycle of Life", forState: .Normal)
        
    }
    @IBAction func savePressed(sender:AnyObject){
        engine.configurations.append(Configuration(title: newConfigurationTextField.text!, positions: engine.createConfigurationBasedOnGrid()))
    }
    
    @IBOutlet weak var gridView: GridView!
    

    override func viewDidLoad() {
                super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        engineDidUpdate(engine.grid)
        engine.delegate = self
        
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        gridView.setNeedsDisplay()
    }
    @IBOutlet weak var runButton: UIButton!
    
    
   
    /* func resetCount() {
        buttonClicks = 1
    } */
    
    func buttonClickAdded() {
        engine.buttonClicks += 1
    }
    
    @IBAction func runButtonPressed(sender: UIButton!) {
        engine.step()
        buttonClickAdded()
        runButton.setTitle("Run \(engine.buttonClicks.description) Cycles of Life", forState: .Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

