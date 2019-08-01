import UIKit

class ToDoCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let editView = UIView()
        editView.backgroundColor = UIColor.red
        multipleSelectionBackgroundView = editView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(by text: String) {
        taskNameLabel.text = text
    }
}
