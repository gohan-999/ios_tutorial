import UIKit

class TableView1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
//        let className = String(describing: "Custom2TableViewCell")
//        let nib = UINib(nibName: className, bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: className)
    }

    //1セクション内に、何行のitemがあるか指定するデリゲートメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    //各indexPathに対応するセルを返すデリゲートメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Custom2TableViewCell") as! Custom2TableViewCell
//        cell.bind(textValue: "サンプル \(indexPath.row)")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Custom1TableViewCell") as! Custom1TableViewCell
        return cell
    }
    
    //セルが選択されたときに呼ばれるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt: \(indexPath.row)")
    }
}
