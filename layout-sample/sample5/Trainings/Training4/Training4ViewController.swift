import UIKit

class Training4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Training4Second", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Navigation")
        present(vc, animated: true, completion: nil)
    }
}
