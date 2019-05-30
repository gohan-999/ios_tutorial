import UIKit

class PushSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionButton(_ sender: Any) {
        let sb = UIStoryboard(name: "PushSample", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "PushViewController")
        let vc = sb.instantiateViewController(withIdentifier: "NavigationRoot")
        self.present(vc, animated: true)
    }
}
