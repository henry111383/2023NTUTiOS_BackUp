import UIKit

class ViewController: UIViewController {

    private var height : Double = 0
    private var weight : Double = 0
    private var BMI : Double = 0
    private var BMIStatus = ""
    
    @IBOutlet weak var HeightText: UITextField!
    @IBOutlet weak var WeightText: UITextField!
    @IBOutlet weak var GenderSC: UISegmentedControl!
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var StatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // click buttom
    @IBAction func touch_BMI(_ sender: UIButton) {
        CalculatorBMI()
    }
    
    // BMI
    private func CalculatorBMI() {
        if let height = Double(HeightText.text!), let weight = Double(WeightText.text!) {
            BMI = weight/pow(height/100, 2)
            BMILabel.text = String(format:"%2.2f",BMI)
            checkstatus()
        }else{
            BMILabel.text = "Check your input!"
            StatusLabel.text = "😵"
        }
    }
    
    // weight status
    func checkstatus() { // check the weigth status
        if BMI < 18.5 {
            StatusLabel.text = "Underweight"
        } else if BMI < 24.9 {
            StatusLabel.text = "Healthy weight"
        } else if BMI < 30 {
            if GenderSC.selectedSegmentIndex == 1 {
                StatusLabel.text = "it's a secret"
            } else { StatusLabel.text = "Overweight" }
        } else {
            if GenderSC.selectedSegmentIndex == 1 {
                StatusLabel.text = "it's a secret"
            } else { StatusLabel.text = "Obesity" }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
      }

}

