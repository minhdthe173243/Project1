import UIKit


protocol MenuDelegate: AnyObject {
    func didSelectVC(menuItem: MenuViewController.MenuOption)
}

protocol ChangeColorBySwitchDelegate: AnyObject {
    func didChangeSwitch(isOn: Bool)
}

protocol MenuViewControllerDelegate: AnyObject {
    func didTapCloseButton()
}
/**
 list page and ttile of menu
 */
class MenuViewController: UIViewController{
    weak var deleagte: MenuDelegate?
    weak var switchDelegate: ChangeColorBySwitchDelegate?
    weak var menuClosed: MenuViewControllerDelegate?
    
    var buttonClosed: UIButton!
    var changeColorBySwitch = UISwitch()
    var selectedIndexPath: IndexPath? // save index of CELL when Click
    
    //list item menu about name and image
    enum MenuOption: String, CaseIterable {
        case darkMode = "Darkmode"
        case home = "Home"
        case favourite = "Favourite"
        case rateApp = "Rate App"
        case share = "Share your friend"
        case termOfPolicy = "Term of policy"
        var imageName: String {
            switch self {
            case .darkMode:
                return "moon"
            case .home:
                return "house"
            case .favourite:
                return "heart"
            case .rateApp:
                return "star"
            case .share:
                return "message"
            case .termOfPolicy:
                return "book.closed"
            }
        }
    }
    
    public var color =  UIColor(red: 33/255, green:  33/255, blue:  33/255, alpha:  1)
    // create table contain list MenuView
    var tableView: UITableView = {
        var table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        // create button CLOSE use hidden nemu
        buttonClosed = clickClosedMenu(view: self.view)
        buttonClosed.addTarget(self, action: #selector(closedMenu), for: .touchUpInside)
    }
}


extension MenuViewController:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = MenuOption.allCases[indexPath.row].rawValue
        // call UIswitch change background of View
        // Autolayout for switchUI on Cell of tableview
        if cell.textLabel?.text == "Darkmode" {
            // setup some attribute for UISwitch
            cell.addSubview(changeColorBySwitch)
            // set status switch follow currient value
            changeColorBySwitch.setOn(changeColorBySwitch.isOn, animated: false)
            changeColorBySwitch.translatesAutoresizingMaskIntoConstraints = false
            
            changeColorBySwitch.transform = CGAffineTransform(scaleX: 0.7, y: 0.64)
            changeColorBySwitch.onTintColor = .systemBlue
            
            changeColorBySwitch.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
            changeColorBySwitch.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -40).isActive = true
            changeColorBySwitch.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        }
        
        // change backgroundColor Cell by status switch
        if changeColorBySwitch.isOn  {
            cell.backgroundColor = color
            cell.imageView?.tintColor = .white
            cell.textLabel?.textColor = .white
        } else {
            cell.backgroundColor = .white
            cell.imageView?.tintColor = .black
            cell.textLabel?.textColor = .black
        }
        // if indexpath = seclectionIndexPath => Update image  and title
        if indexPath == selectedIndexPath {
            cell.imageView?.tintColor = .systemBlue
            cell.textLabel?.textColor = .systemBlue
        }
        
        cell.imageView?.image = UIImage(systemName: MenuOption.allCases[indexPath.row].imageName)
        //        cell.contentView.backgroundColor = changeColorBySwitch.isOn ? color : .white
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOption.allCases[indexPath.row]
        deleagte?.didSelectVC(menuItem: item)
        
        //check previousIndexPath already exists . if not exists -> not run func
        if let previousIndexPath = selectedIndexPath {
            if let previousCell = tableView.cellForRow(at: previousIndexPath) {
                // Reset appearance of the previously selected cell
                previousCell.imageView?.tintColor = changeColorBySwitch.isOn ? .white : .black
                previousCell.textLabel?.textColor = changeColorBySwitch.isOn ? .white : .black
            }
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            // Update appearance of the currently selected cell
            cell.imageView?.tintColor = .systemBlue
            cell.textLabel?.textColor = .systemBlue
        }
        // Update the selectedIndexPath to the currently selected cell
        selectedIndexPath = indexPath
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width - 100, height: view.bounds.size.height)
    }
    
    
    // func 1 : change color for attribuite of Class Menu
    // transmit DELEGATE
    @objc func changeColor() {
        changeColorBackground()
        switchDelegate?.didChangeSwitch(isOn: changeColorBySwitch.isOn)
    }
    
    // button user hidden Menu
    @objc func closedMenu() {
        menuClosed?.didTapCloseButton()
    }
    
}



