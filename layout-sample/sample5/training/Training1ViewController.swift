import UIKit

class Training1ViewController: UIViewController {

    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var bardButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedDogButton(_ sender: Any) {
        answerLabel.text = "🐶"
        setBackgroundColor(type: "dog")
    }

    @IBAction func tappedCatButton(_ sender: Any) {
        answerLabel.text = "🐱"
        setBackgroundColor(type: "cat")
    }

    @IBAction func tappedBardButton(_ sender: Any) {
        answerLabel.text = "🐔"
        setBackgroundColor(type: "bard")
    }

    func setBackgroundColor(type: String) {
        dogButton.backgroundColor = type == "dog" ? .brown : .orange
        catButton.backgroundColor = type == "cat" ? .brown : .orange
        bardButton.backgroundColor = type == "bard" ? .brown : .orange
    }
}
