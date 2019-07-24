import UIKit
import RxSwift
import RxCocoa

class RxCocoa1ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favListLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    let inputTextEvent = PublishSubject<Bool>()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingRx()
    }
    
    private func bindingRx() {
        textField.rx
            .text
            .bind(to: textLabel.rx.text)
            .disposed(by: disposeBag)

        textField.rx
            .text
            .subscribe(onNext: { text in
                guard let text = text else { return }
                self.inputTextEvent.onNext(!text.isEmpty)
            })
            .disposed(by: disposeBag)

        inputTextEvent
            .bind(to: imageView.rx.isHidden)
            .disposed(by: disposeBag)

        inputTextEvent
            .bind(to: searchButton.rx.isEnabled)
            .disposed(by: disposeBag)

        searchButton.rx
            .tap
            .asObservable()
            .subscribe(onNext: { _ in
                let storyBoard = UIStoryboard(name: "RxCocoa2ViewController", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "RxCocoa2ViewController")
                let sample3 = vc as! RxCocoa2ViewController
                sample3.text.accept(self.textField.text!)
                self.present(sample3, animated: true, completion: nil)
                
                sample3.addFavoriteEvent
                    .map { return "\(self.favListLabel.text!)\n「\($0)」" }
                    .bind(to: self.favListLabel.rx.text)
                    .disposed(by: self.disposeBag)
            })
            .disposed(by: disposeBag)
    }
}
