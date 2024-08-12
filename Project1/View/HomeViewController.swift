
import UIKit


protocol HomeDelegate: AnyObject {
    func clickMenu()
}


class HomeViewController: UIViewController {
    
    weak var delegate: HomeDelegate?
    
    @objc func clickMenu() {
        delegate?.clickMenu()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         add detail small
         */
        title = "Anime Quotes"
        view.backgroundColor = .cyan
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                                                           style: .plain, target: self, action: #selector(clickMenu))
        
        /**
         add LableView into Homeview
         Auto Layout for LableView
         add text follow JSON
         */
        view.addSubview(lableView)
        setupLabelConstraints()
        disPlayLableViewJSON()
        
        /**
         add stack contain button status button view
         */
        ViewConntainButtonStatus(view: view.self)
        
        
        let nextButton = createButtonNextText()
               view.addSubview(nextButton)
        
    }
    
    
  
    
    //AutoLayOut for LableView follow view
    func setupLabelConstraints() {
        lableView.translatesAutoresizingMaskIntoConstraints = false
        lableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        lableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        lableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        lableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -185).isActive = true
    }
    
    
    
    
}




