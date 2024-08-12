

import UIKit


protocol MenuDelegate: AnyObject {
    func didSelectVC(menuItem: MenuViewController.MenuOption)
}



class MenuViewController: UIViewController{
    
    weak var deleagte: MenuDelegate?
    
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
    
    var color =  UIColor(red: 33/255, green:  33/255, blue:  33/255, alpha:  1)
    
    private var tableView: UITableView = {
        var table = UITableView()
    
        table.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = color
        
  
        
    }
}


extension MenuViewController:  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = MenuOption.allCases[indexPath.row].rawValue
        cell.backgroundColor = color
        cell.imageView?.image = UIImage(systemName: MenuOption.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        cell.textLabel?.textColor = .white
        cell.contentView.backgroundColor = color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOption.allCases[indexPath.row]
        deleagte?.didSelectVC(menuItem: item)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width - 100, height: view.bounds.size.height)
    }
    
 
}




