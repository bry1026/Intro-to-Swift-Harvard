
import UIKit

class InstrumentationViewController: UIViewController {
    let engine = StandardEngine.sharedInstance
    
    @IBOutlet weak var colStepper: UIStepper!
    @IBOutlet weak var colTextField: UITextField!
    @IBAction func colStepperPressed(sender: UIStepper) {
        engine.cols = Int(colStepper.value)
        engine.rows = Int(colStepper.value)
        rowStepper.value = colStepper.value
        colTextField.text = Int(engine.cols).description
        rowTextField.text = Int(engine.rows).description
        //engine.grid = Grid(engine.cols, engine.cols)
    }
    
    @IBOutlet weak var rowStepper: UIStepper!
    @IBOutlet weak var rowTextField: UITextField!
    
    @IBAction func rowStepperPressed(sender: UIStepper) {
        engine.rows = Int(rowStepper.value)
        engine.cols = Int(rowStepper.value)
        colStepper.value = rowStepper.value
        rowTextField.text = Int(engine.rows).description
        colTextField.text = Int(engine.cols).description
        //engine.grid = Grid(engine.rows, engine.rows)
    }
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBAction func reloadPressed(sender: UIButton!) {
        if let newUrl = urlTextField.text{
            engine.loadConfigurations(newUrl)
        } else{
            return urlTextField.text = "No Text Entered"
        }
    }
    
    @IBAction func sliderMoved(sender: UISlider!){
        engine.refreshRate = Double(sender.value)
        autoPilotSwitch.setOn(true, animated: true)
    }
    @IBOutlet weak var autoPilotSwitch: UISwitch!
    
    
    
    @IBAction func switchPressed(sender: UISwitch!){
        if sender.on{
            engine.refreshTimer?.invalidate()
            engine.startTimer()
        } else{
            engine.refreshTimer?.invalidate()
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
    
    
}

