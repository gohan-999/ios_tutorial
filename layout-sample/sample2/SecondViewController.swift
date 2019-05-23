import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
