import UIKit
import RxSwift

class RxSwiftSample3ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!

    var text = ""
    let addFavoriteEvent = PublishSubject<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text
    }

    @IBAction func tappedButton(_ sender: Any) {
        addFavoriteEvent.onNext(text)
    }
    
    @IBAction func tappedCloseButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
