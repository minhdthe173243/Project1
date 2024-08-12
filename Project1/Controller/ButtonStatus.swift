
import UIKit

/**
- create buttons to display state when user click ay buttom view
-
 */
func customerButton(title: String, imageBeforState: String, imageAfterState: String) -> UIButton {
    
    let button = UIButton(type: .system)
    var config = UIButton.Configuration.plain()
    config.imagePadding = 2
    config.title = title
    config.imagePlacement = .top
    config.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    button.configuration = config
    
    var isDefaultImage = true
    button.configuration?.image = UIImage(systemName: imageBeforState)
    button.addAction(UIAction { _ in
        isDefaultImage.toggle()
        if isDefaultImage {
            button.configuration?.image = UIImage(systemName: imageBeforState)
        } else {
            button.configuration?.image = UIImage(systemName: imageAfterState)
        }
    }, for: .touchUpInside)
    
    return button
}


var buttonCoppy: UIButton = customerButton(title: "Coppy", imageBeforState: "square.on.square",imageAfterState: "square.filled.on.square")
var buttonFavourite: UIButton = customerButton(title: "Favourite", imageBeforState: "heart",imageAfterState: "heart.fill")
var buttonShare: UIButton = customerButton(title: "Share", imageBeforState: "arrowshape.turn.up.forward",imageAfterState: "arrowshape.turn.up.forward.fill")

var arrayButton: [UIView] = [buttonCoppy ,buttonFavourite, buttonShare]






/**
 create button can next text of word dispaly view
 */


func createButtonNextText() -> UIButton {
    let button = UIButton(type: .system)
    button.frame = CGRect(x: 100, y: 100, width: 30, height: 30)
   
            button.layer.masksToBounds = true
    button.layer.cornerRadius = button.frame.width/2
    var config = UIButton.Configuration.plain()
    config.background.backgroundColor = .blue
    
    config.image = UIImage(systemName: "arrow.right")
    
    button.configuration = config
    

    return button
}


var buttonTextLeft = createButtonNextText()
var buttontextRight = createButtonNextText()






  /**
    add 3 button Status by StackView at buttom view
   */
func ViewConntainButtonStatus(view: UIView) {
      
      let viewContain: UIStackView = {
          let stack = UIStackView(arrangedSubviews: arrayButton)
          
          stack.axis = .horizontal
          stack.spacing = 20
          stack.layoutMargins = UIEdgeInsets(top: 10, left: 25, bottom: 5, right: 25)
          stack.isLayoutMarginsRelativeArrangement = true
          stack.distribution = .fillEqually
          return stack
      }()
      
      
      view.addSubview(viewContain)
      
      viewContain.layer.cornerRadius = 35
      viewContain.clipsToBounds = true
      viewContain.backgroundColor = .white
      viewContain.translatesAutoresizingMaskIntoConstraints = false
      viewContain.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
      viewContain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
      viewContain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
      viewContain.heightAnchor.constraint(equalToConstant: 70).isActive = true
      
  }
