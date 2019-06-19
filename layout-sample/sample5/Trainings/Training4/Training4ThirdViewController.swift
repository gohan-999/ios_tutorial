import UIKit

class Training4ThirdViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    var titleText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Training4Fourth", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Training4FourthViewController")
        let training4Fourth = vc as! Training4FourthViewController
        training4Fourth.titleText = titleText
        navigationController?.pushViewController(vc, animated: true)
    }
}
