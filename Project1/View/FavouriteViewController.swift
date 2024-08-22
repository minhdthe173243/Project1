import UIKit


class FavouriteViewController: UIViewController {
    var tableContenttextFavourite: UITableView = {
        var table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "CELLFAVOURITE")
        return table
    }()
    override func viewWillLayoutSubviews() {
        view.backgroundColor = .white
        title = "Favourite"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Favourite"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        displayTableContainTextFavourite()
        tableContenttextFavourite.reloadData()
    }
    
    func displayTableContainTextFavourite() {
        view.addSubview(tableContenttextFavourite)
        tableContenttextFavourite.backgroundColor = .white
        tableContenttextFavourite.dataSource = self
        tableContenttextFavourite.delegate = self
        tableContenttextFavourite.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            tableContenttextFavourite.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableContenttextFavourite.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            tableContenttextFavourite.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableContenttextFavourite.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    /**
     reload Lable text favourite to up Screen
     */
    //    override func viewWillLayoutSubviews() {
    ////        textFavourite(view: view.self)
    //        tableContenttextFavourite.reloadData()
    //    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableContenttextFavourite.reloadData()
    }
}




extension FavouriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return containtFavorite.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableContenttextFavourite.dequeueReusableCell(withIdentifier: "CELLFAVOURITE", for: indexPath)
        print(containtFavorite.data[indexPath.section].quote)
        cell.textLabel?.text = containtFavorite.data[indexPath.section].quote
        cell.textLabel?.textColor = .white
        let color = [ [UIColor.green.cgColor, UIColor.blue.cgColor],
                      [UIColor.red.cgColor, UIColor.blue.cgColor],
                      [UIColor.yellow.cgColor, UIColor.orange.cgColor],
                      [UIColor.cyan.cgColor, UIColor.blue.cgColor],
                      [UIColor.link.cgColor, UIColor.green.cgColor] ]
        let randomColor = color.randomElement()!
        cell.backgroundColor = .blue
        backgroundGradientColor(view: cell, color: randomColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }

}


