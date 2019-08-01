import UIKit

class ToDoDetailViewController: UIViewController {

    @IBOutlet weak var taskNameLabel: UILabel! {
        didSet {
            taskNameLabel.text = taskName
        }
    }

    var taskName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
