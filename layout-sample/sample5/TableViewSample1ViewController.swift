import UIKit

class TableViewSample1ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let className = "ReuseCustom1"
        let nib = UINib(nibName: className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: className)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ReuseCustom1") as! ReuseCustom1TableViewCell
        cell.bind(text: "サンプル \(indexPath.row)")
//        if indexPath.row % 3 == 0 {
//            cell.backgroundColor = UIColor.red
//        }
        return cell
    }

}
