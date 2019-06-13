import UIKit

class Training3ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var validMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else {
            validMessageLabel.text = "※名前を入力してください"
            return
        }
        validMessageLabel.text = ""
        let storyBoard = UIStoryboard(name: "Training3Second", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Training3SecondViewController")
        let training3Second = vc as! Training3SecondViewController
        training3Second.name = text
        navigationController?.pushViewController(vc, animated: true)
    }
}
