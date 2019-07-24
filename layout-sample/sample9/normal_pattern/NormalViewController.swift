import UIKit
import RxSwift

class NormalViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favListLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    @IBAction func tappedSearchButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Normal2ViewController", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Normal2ViewController")
        let sample3 = vc as! Normal2ViewController
        sample3.text = textField.text!
        present(sample3, animated: true, completion: nil)
        
        sample3.addFavoriteEvent
            .map { return "「\($0)」" }
            .subscribe(onNext: { element in
                self.favListLabel.text = "\(self.favListLabel.text!)\n\(element)"
            })
            .disposed(by: disposeBag)
    }
    
    @objc private func endEditing() {
        textField.resignFirstResponder()
    }

    private func displayUpdate(by text: String) {
        imageView.isHidden = !text.isEmpty
        searchButton.isEnabled = !text.isEmpty
        textLabel.text = text
    }
}

extension NormalViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var text = ""
        if string.isEmpty {
            text = "\(textField.text!.prefix(textField.text!.count - 1))"
        } else {
            text = "\(textField.text!)\(string)"
        }
        displayUpdate(by: text)
        return true
    }
}
