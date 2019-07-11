import UIKit
import RxSwift

class RxSwiftSample2ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favListLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedSearchButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "RxSwiftSample3ViewController", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "RxSwiftSample3ViewController")
        let sample3 = vc as! RxSwiftSample3ViewController
        sample3.text = textField.text!
        present(sample3, animated: true, completion: nil)
        
        sample3.addFavoriteEvent
            .map { return "「\($0)」" }
            .subscribe(onNext: { element in
                self.favListLabel.text = "\(self.favListLabel.text!)\n\(element)"
            })
            .disposed(by: disposeBag)
    }
}
