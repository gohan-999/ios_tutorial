import UIKit
import RxSwift
import RxCocoa

class ToDoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    private let disposeBag = DisposeBag()
    private var tasks = [
        "肉買う",
        "人参買う",
        "ジャガイモ買う",
        "玉ねぎ買う",
        "ルー買う",
        "果物買う",
        "宿題やる",
        "小説読む"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        bindingRx()
    }

    private func bindingRx() {
        editButton.rx
            .tap
            .subscribe(onNext: { _ in
                self.tableView.setEditing(!self.tableView.isEditing, animated: true)
            })
            .disposed(by: disposeBag)

        addButton.rx
            .tap
            .subscribe(onNext: { _ in
                let alert = UIAlertController(title: "タスク追加", message: "タスク名を入力してください", preferredStyle: .alert)
                alert.addTextField(configurationHandler: { textField in
                    textField.placeholder = "タスク名"
                })
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler:{ alertAction in
                    let textFileds = alert.textFields as [UITextField]?
                    if let textField = textFileds?.first {
                        self.tasks.append(textField.text!)
                        let indexPath = IndexPath(row: self.tasks.count - 1, section: 0)
                        self.tableView.insertRows(at: [indexPath], with: .automatic)
                    }
                })
                
                let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)
                
                alert.addAction(cancelAction)
                alert.addAction(defaultAction)
                
                self.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}

extension ToDoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "ToDoDetailViewController", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ToDoDetailViewController")
        let detail = vc as! ToDoDetailViewController
        detail.taskName = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
