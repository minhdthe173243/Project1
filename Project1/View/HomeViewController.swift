import UIKit


protocol HomeDelegate: AnyObject {
    func clickMenu()
}

var statusIndex: Int = 0



class HomeViewController: UIViewController {
    weak var delegate: HomeDelegate?
    var changeColorBySwitch = UISwitch()
    public var isOn = false
    
    
    override func viewWillLayoutSubviews() {
        let image = UIImage(systemName: "heart")
        buttonFavourite.setImage(image, for: .normal)
        let firstItem = result!.data
        if (containtFavorite.data.contains(where: { $0.id == firstItem[statusIndex].id  }))  {
            let filledImage = UIImage(systemName: "heart.fill")?.withTintColor(.systemBlue,renderingMode: .alwaysOriginal)
            buttonFavourite.setImage(filledImage, for: .normal)
        } else {
            if(isOn) {
                buttonFavourite.tintColor = .white
            } else {
                buttonFavourite.tintColor = .black
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         add detail small
         */
        title = "Anime Quotes"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        viewContain.backgroundColor = colorAlpha(color: .white, number: 1)
        view.backgroundColor = colorAlpha(color: .secondarySystemBackground, number: 0.95)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(clickMenu))
        
        /**
         add LableView into Homeview
         Auto Layout for LableView
         add text follow JSON
         */
        setupLabelConstraints(view: self.view)
        disPlayLableViewJSON()
        // add stack contain button status button view
        ViewConntainButtonStatus(view: view.self)
        ViewContainButtonChangText(view: view.self)
        containSilderView(view: view.self)
        
        buttonTextRight.addTarget(self, action: #selector(ClickButtonChangeNextText), for: .touchUpInside)
        buttonTextLeft.addTarget(self, action: #selector(ClickButtonChangeBackText), for: .touchUpInside)
        
        slider.addTarget(self, action: #selector(changeSizeText), for: .touchUpInside)
        viewContainViewImageOrColor(view: self.view)
        
        buttonFavourite.addTarget(self, action: #selector(statusFavourite), for: .touchUpInside)
    }
    
    var index: Int = 0
    @objc func clickMenu() {
        delegate?.clickMenu()
    }
    
    @objc func ClickButtonChangeNextText() {
        guard let result = result else {
            return
        }
        if(index >= 0 && index < result.data.count - 1) {
            index += 1
            disPlayText(index: index)
        }
        else {
            index = 0
            disPlayText(index: index)
        }
        statusIndex = index
    }
    
    @objc func ClickButtonChangeBackText() {
        if(index > 0 && index < result?.data.count ?? 0) {
            index -= 1
            disPlayText(index: index)
        } else {
            index = (result?.data.count)! - 1
            disPlayText(index: index)
        }
        statusIndex = index
    }
    
    /** chang size Text of desctription*/
    @objc func changeSizeText() {
        let fontSize = CGFloat(slider.value)
        descriptionText.font = UIFont(name: titleText.font.fontName, size: fontSize)
        //        titleText.sizeToFit()
    }
    
    /**
     click button get  the text at current time on the screen
     */
    @objc func statusFavourite() {
        let firstItem = result!.data
        print(firstItem[statusIndex].id)
        if buttonFavourite.currentImage == UIImage(systemName: "heart") {
            contantTextFavorite(index: firstItem[statusIndex])
            
            //            if (containtFavorite.data.contains(where: { $0.id == firstItem[statusIndex].id  }))  {
            //                buttonFavourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            //            } else {
            //                buttonFavourite.setImage(UIImage(systemName: "heart"), for: .normal)
            //            }
            
        } else {
            buttonFavourite.setImage(UIImage(systemName: "heart"), for: .normal)
            removeContainTextFavorite(index: firstItem[statusIndex])
        }
    }
}






