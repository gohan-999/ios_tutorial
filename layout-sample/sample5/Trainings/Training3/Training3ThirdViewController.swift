import UIKit

class Training3ThirdViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!

    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(name)さん thaks!"
    }

    @IBAction func tappedButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
