import UIKit

enum MenuState {
    case open, closed
}



class ContentViewController: UIViewController{
    public var menuState: MenuState = .closed
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    lazy var favouriteVC = FavouriteViewController()
    var resertVC: UIViewController?
    var naviVC: UINavigationController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVC.switchDelegate = homeVC
//        menuVC.switchDelegate = favouriteVC
        addChildView()
        menuVC.menuClosed = self
    }
    
      
    func addChildView() {
        // home
        homeVC.delegate = self
        let naviVC = UINavigationController(rootViewController: homeVC)
        addChild(naviVC)
        view.addSubview(naviVC.view)
        naviVC.didMove(toParent: self)
        self.naviVC = naviVC
        self.resertVC = homeVC
        // menu
        menuVC.deleagte = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)

        self.menuVC.view.frame = CGRect(x: -self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
}


extension ContentViewController: HomeDelegate {
    func clickMenu() {
        // animate the menu CLOSE/OPEN
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                // create alpha when Menu opening
                self.menuVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.bounds.height)
            } completion: { done in
                if done {
                    self.menuVC.view.backgroundColor = colorAlpha(color: .black, number: 0.5)
                    self.menuVC.view.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
                    self.menuState = .open
                }
            }
            
        case .open:
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.menuVC.view.frame = CGRect(x: -self.view.bounds.width, y: 0, width: self.view.bounds.width , height: self.view.bounds.height)
            } completion: { done in
                if done {
                    self.menuState = .closed
                }
            }
        }
    }
}



extension ContentViewController: MenuViewControllerDelegate {
    func didTapCloseButton() {
        clickMenu()
    }
}



extension ContentViewController : MenuDelegate {
    func didSelectVC(menuItem: MenuViewController.MenuOption) {
        clickMenu()
        switch menuItem {
        case .darkMode:
            break
        case .home:
            switchToViewController(homeVC)
            break
        case .favourite:
            // favourite
            switchToViewController(favouriteVC)
            break
        case .rateApp:
            let vc = RateAppViewController()
            self.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            break
        case .share:
            break
        case .termOfPolicy:
            break
        }
    }
    
    
    
    func switchToViewController(_ newVC: UIViewController) {
        guard let resertVC = resertVC else { return }
        if newVC != homeVC {
            homeVC.addChild(favouriteVC)
            homeVC.view.addSubview(newVC.view)
            newVC.view.frame = view.frame
            newVC.didMove(toParent: homeVC)
            homeVC.title = newVC.title
        } else {
            if resertVC == homeVC {
                return
            }
            resertVC.view.removeFromSuperview()
            resertVC.didMove(toParent: nil)
            homeVC.title = "Anime Quotes"
//            didChangeSwitch(isOn: true)
        }
        self.resertVC = newVC
    }
}
