import UIKit

class Training2ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedCloseButton(_ sender: Any) {
        if navigationController == nil {
            dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "確認しましょう", message: "push遷移時は「閉じる」ではなく「戻る」です", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler:{ _ in
            })
            
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
