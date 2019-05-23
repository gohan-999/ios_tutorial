import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedButton(_ sender: Any) {
        let sb = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(vc, animated: true, completion: nil)
    }
}
