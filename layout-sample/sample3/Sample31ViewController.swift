import UIKit

class Sample31ViewController: UIViewController {

    var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label?.text = "サンプルLabel"
        view.addSubview(label!)
        
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        button.setTitle("サンプルbutton", for: .normal)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    @objc func actionButton() {
        label?.text = "タップ！"
    }
}
