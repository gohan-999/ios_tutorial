import UIKit
import RxSwift
import RxCocoa

class RxTableViewSimpleToDoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let name = "ToDoCustomTableViewCell"
            let nib = UINib(nibName: name, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: name)
        }
    }
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!

    private let disposeBag = DisposeBag()
    private var tasksSubject = BehaviorRelay<[String]>(value: [])
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
        tasksSubject.accept(tasks)
    }

    private func bindingRx() {
        tasksSubject
            .bind(to: tableView.rx.items) { tableView, row, taskName in
                let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCustomTableViewCell") as! ToDoCustomTableViewCell
                cell.bind(by: taskName)
                return cell
            }
            .disposed(by: disposeBag)

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
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { alertAction in
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
