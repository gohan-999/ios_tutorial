import UIKit

class Training5ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 25
        loginButton.layer.borderColor = UIColor.blue.cgColor
        loginButton.layer.borderWidth = 1
        createButton.layer.cornerRadius = 25
    }
}
