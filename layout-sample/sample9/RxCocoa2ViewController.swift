import UIKit
import RxSwift
import RxCocoa

class RxCocoa2ViewController: UIViewController {
    
    @IBOutlet weak var favoriteAddButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    var text = BehaviorRelay<String>(value: "")
    let addFavoriteEvent = PublishSubject<String>()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindingRx()
    }
    
    private func bindingRx() {
        text
            .bind(to: textLabel.rx.text)
            .disposed(by: disposeBag)

        favoriteAddButton.rx
            .tap
            .map { return self.text.value }
            .bind(to: addFavoriteEvent)
            .disposed(by: disposeBag)
        
        closeButton.rx
            .tap
            .subscribe(onNext: { _ in
                self.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
    }
}
