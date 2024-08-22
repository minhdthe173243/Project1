import UIKit



extension MenuViewController {
    // func gennerality for class Ment When Switch change status
    func generChangeColorForMenu(tableColor: UIColor, buttonCLOSE: UIColor) {
        tableView.backgroundColor = tableColor
        buttonClosed.setTitleColor(buttonCLOSE, for: .normal)
    }
    
    func changeColorBackground() {
        if changeColorBySwitch.isOn {
            generChangeColorForMenu(tableColor: color, buttonCLOSE: .white)
        } else {
            generChangeColorForMenu(tableColor: .white, buttonCLOSE: .black)
        }
        // reload tableView to apply the new color to all cells
        tableView.reloadData()
    }
}



extension FavouriteViewController : ChangeColorBySwitchDelegate {
    // func generality for class Favourite --> change color follow Switch
    func generChangeColorForFavorite(text: String, textColor: UIColor, tableAndView: UIColor){
        title = text
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColor]
        tableContenttextFavourite.backgroundColor = tableAndView
        view.backgroundColor = tableAndView
    }
    
    func didChangeSwitch(isOn: Bool) {
        if isOn {
            generChangeColorForFavorite(text: "Favourite", textColor: .white, tableAndView: .black)
        } else {
            generChangeColorForFavorite(text: "Favourite", textColor: .black, tableAndView: .white)
        }
    }
}



extension HomeViewController: ChangeColorBySwitchDelegate {
    func generChangeColorForHome(text: String, textColor: UIColor, StackContainButton: UIColor, ViewColor: UIColor, buttonStatusColor: UIColor) {
        title = text
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColor]
        
        viewContain.backgroundColor = StackContainButton
        view.backgroundColor = ViewColor
        buttonCopy.tintColor = buttonStatusColor
        buttonShare.tintColor = buttonStatusColor
        buttonFavourite.tintColor = buttonStatusColor
        
        viewLeft.backgroundColor = ViewColor
        viewRight.backgroundColor = ViewColor
        viewLeft.tintColor = ViewColor
        viewRight.tintColor = ViewColor
    }
    
    func didChangeSwitch(isOn: Bool) {
        if isOn {
            generChangeColorForHome(text: "Anime Quotes", textColor: .white, StackContainButton: colorAlpha(color: .gray, number: 0.4), ViewColor: .black, buttonStatusColor: .white)
            self.isOn = true
            print("ison TRUE")
            
        } else {
            generChangeColorForHome(text: "Anime Quotes", textColor: .black, StackContainButton: .white, ViewColor: colorAlpha(color: .secondarySystemBackground, number: 0.95), buttonStatusColor: .black)
            self.isOn = false
            print("isOn False")
        }
    }
}

