

import UIKit

class ContentViewController: UIViewController{
    
    
    enum MenuState {
        case open, closed
    }
    
    private var menuState: MenuState = .closed
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    lazy var favouriteVC = FavouriteViewController()
    var resertVC: UIViewController?
    var naviVC: UINavigationController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        addChildView()
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
        
       
        self.menuVC.view.isHidden = true
    }
}



extension ContentViewController: HomeDelegate {
    func clickMenu() {
        // animate the menu
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
//                self.naviVC?.view.frame.origin.x = self.homeVC.view.frame.width - 100
                self.menuVC.view.isHidden = false
            } completion: { done in
                if done {
                    self.menuState = .open
                }
            }
    

            
        case .open:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
//                self.naviVC?.view.frame.origin.x = 0
                self.menuVC.view.isHidden = true
            } completion: { done in
                if done {
                    self.menuState = .closed
                }
            }
            
        }
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
            homeVC.title = "Home"
        }
        self.resertVC = newVC
    
    }
}
