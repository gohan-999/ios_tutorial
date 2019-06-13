import UIKit

class Training2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedModalButton(_ sender: Any) {
        let alert = UIAlertController(title: "画面選択", message: "どちらの画面に遷移しますか？", preferredStyle: .alert)
        let secondAction = UIAlertAction(title: "second", style: .default, handler:{ _ in
            let storyBoard = UIStoryboard(name: "Training2Second", bundle: nil)
            self.modalTransition(sb: storyBoard, identifier: "Training2SecondViewController")
        })
        let thirdAction = UIAlertAction(title: "third", style: .default, handler:{ _ in
            let storyBoard = UIStoryboard(name: "Training2Third", bundle: nil)
            self.modalTransition(sb: storyBoard, identifier: "Training2ThirdViewController")
        })
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)
        
        alert.addAction(cancelAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tappedPushButton(_ sender: Any) {
        let alert = UIAlertController(title: "画面選択", message: "どちらの画面に遷移しますか？", preferredStyle: .alert)
        let secondAction = UIAlertAction(title: "second", style: .default, handler:{ _ in
            let storyBoard = UIStoryboard(name: "Training2Second", bundle: nil)
            self.pushTransition(sb: storyBoard, identifier: "Training2SecondViewController")
        })
        let thirdAction = UIAlertAction(title: "third", style: .default, handler:{ _ in
            let storyBoard = UIStoryboard(name: "Training2Third", bundle: nil)
            self.pushTransition(sb: storyBoard, identifier: "Training2ThirdViewController")
        })

        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)
        
        alert.addAction(cancelAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func pushTransition(sb: UIStoryboard, identifier: String) {
        let vc = sb.instantiateViewController(withIdentifier: identifier)
        navigationController?.pushViewController(vc, animated: true)
    }

    private func modalTransition(sb: UIStoryboard, identifier: String) {
        let vc = sb.instantiateViewController(withIdentifier: identifier)
        present(vc, animated: true, completion: nil)
    }
}
