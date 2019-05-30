import UIKit

class Sample3PushFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Sample3PushSecondViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Sample3PushSecondViewController")
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func tappedPushButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Sample3PushSecondViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Sample3PushSecondViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
