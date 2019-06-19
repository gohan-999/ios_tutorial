import UIKit

class Training4SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let books = [
        "リーダブルコード",
        "改訂2版 パーフェクトRuby",
        "体系的に学ぶ 安全なWebアプリケーションの作り方 第2版 脆弱性が生まれる原理と対策の実践",
        "達人に学ぶSQL徹底指南書 第2版 初級者で終わりたくないあなたへ",
        "SQLアンチパターン",
        "詳解MySQL 5.7",
        "HTML5/CSS3モダンコーディング フロントエンドエンジニアが教える3つの本格レイアウト スタンダード・グリッド・シングルページレイアウトの作り方",
        "アジャイルソフトウェア開発の奥義",
        "新しいLinuxの教科書"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let name = "Training4CustomCell"
        let nib = UINib(nibName: name, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: name)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Training4CustomCell") as! Training4CustomTableViewCell
        cell.bind(title: books[indexPath.row], row: indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Training4Third", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Training4ThirdViewController")
        let training4Third = vc as! Training4ThirdViewController
        training4Third.titleText = books[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
