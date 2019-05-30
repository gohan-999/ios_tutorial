import UIKit

class PushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Sample3PushFirstViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Sample3PushFirstViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
