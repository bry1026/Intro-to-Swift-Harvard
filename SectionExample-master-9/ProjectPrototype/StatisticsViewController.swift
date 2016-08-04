
import UIKit

class StatisticsViewController: UIViewController, EngineDelegate {

    @IBOutlet weak var aliveTextField: UITextField!
    @IBOutlet weak var bornTextField: UITextField!
    @IBOutlet weak var diedTextField: UITextField!
    @IBOutlet weak var emptyTextField: UITextField!
    
    
    let engine = StandardEngine.sharedInstance
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        engineDidUpdate(engine.grid)
        engine.delegate = self
    
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        
        aliveTextField.text = withGrid.alive.description
        bornTextField.text = withGrid.born.description
        diedTextField.text = withGrid.died.description
        emptyTextField.text = withGrid.empty.description
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
