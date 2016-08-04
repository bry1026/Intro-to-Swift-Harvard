
import UIKit

class InstrumentationViewController: UIViewController {
   let engine = StandardEngine.sharedInstance
    
    @IBOutlet weak var colStepper: UIStepper!
    @IBOutlet weak var colTextField: UITextField!
    @IBAction func colStepperPressed(sender: UIStepper) {
        engine.cols = Int(colStepper.value)
        colTextField.text = Int(engine.cols).description
        //engine.grid = Grid(engine.cols, engine.cols)
    }
    
    @IBOutlet weak var rowStepper: UIStepper!
    @IBOutlet weak var rowTextField: UITextField!
    
    @IBAction func rowStepperPressed(sender: UIStepper) {
        engine.rows = Int(rowStepper.value)
        rowTextField.text = Int(engine.rows).description
        //engine.grid = Grid(engine.rows, engine.rows)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

