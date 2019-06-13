import UIKit

class Training3SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(name)さん"
    }

    @IBAction func tappedButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Training3Third", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Training3ThirdViewController")
        let training3Third = vc as! Training3ThirdViewController
        training3Third.name = name
        navigationController?.pushViewController(vc, animated: true)
    }
}
