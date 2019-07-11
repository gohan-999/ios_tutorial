import UIKit
import RxSwift

class RxSwiftSample1ViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindingRx()
    }
    
    private func bindingRx() {
//        Observable
//            .of(1,2,3)
//            .do (onNext: { print("------do: \($0)") })
//            .map { $0 * $0 }
//            .subscribe(onNext: { element in
//                print("----------: \(element)")
//            })
//            .disposed(by: disposeBag)

        // PublishSubject
        let sampleSubject = PublishSubject<Int>()
        sampleSubject
            .do(onNext: { print("------do: \($0)") })
            .map { $0 * $0 }
            .subscribe(onNext: { element in
                print("----------: \(element)")
            })
            .disposed(by: disposeBag)

        sampleSubject.onNext(1)
        sampleSubject.onNext(2)
        sampleSubject.onNext(3)
        
        // BehaviorSubject
        let sampleBehaviorSubject = BehaviorSubject<Int>(value: 0)
        sampleBehaviorSubject
            .do(onNext: { print("------do: \($0)") })
            .map { $0 * $0 }
            .subscribe(onNext: { element in
                print("----------: \(element)")
            })
            .disposed(by: disposeBag)

        sampleBehaviorSubject.onNext(1)
        sampleBehaviorSubject.onNext(2)
        sampleBehaviorSubject.onNext(3)
    }
}
