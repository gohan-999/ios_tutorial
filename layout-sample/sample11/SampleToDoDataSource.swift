import UIKit
import RxSwift
import RxCocoa

class SampleToDoDataSource: NSObject {
    typealias Element = [String]
    
    var items: [String] = []
}

extension SampleToDoDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCustomTableViewCell") as! ToDoCustomTableViewCell
        cell.bind(by: items[indexPath.row])
        return cell
    }
}

extension SampleToDoDataSource: UITableViewDelegate {

}

extension SampleToDoDataSource: RxTableViewDataSourceType {
    func tableView(_ tableView: UITableView, observedEvent: Event<Element>) {
        Binder(self) { dataSource, element in
            dataSource.items = element
            tableView.reloadData()
            }
            .on(observedEvent)
    }
}
