import UIKit

class Training4FourthViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    var titleText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
    }

    @IBAction func tappedButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
