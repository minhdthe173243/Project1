import UIKit

/**
 - create buttons to display state when user click ay buttom view
 -
 */


func customerButton(title: String, imageBeforState: String,color: UIColor) -> UIButton {
    let button = UIButton(type: .system)
    var config = UIButton.Configuration.plain()
    config.imagePadding = 2
    config.title = title
    
    config.imagePlacement = .top
    config.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    button.setImage(UIImage(systemName: imageBeforState), for: .normal) //= UIImage(systemName: imageBeforState)
    button.tintColor = color
    button.configuration = config
    return button
}


var buttonCopy: UIButton = customerButton(title: "Copy", imageBeforState: "square.on.square", color: .black)
var buttonFavourite: UIButton = customerButton(title: "Favourite", imageBeforState: "heart", color: .black)
var buttonShare: UIButton = customerButton(title: "Share", imageBeforState: "arrowshape.turn.up.forward", color: .black)

var arrayButton: [UIView] = [buttonCopy ,buttonFavourite, buttonShare]


/**
 create button can next text of word dispaly view
 */

func createButtonNextText(image: String) -> UIButton {
    let button = UIButton(type: .system)
    
    button.backgroundColor = .systemBlue
    button.setImage(UIImage(systemName: image), for: .normal)
    button.tintColor = .white // Đặt màu cho hình ảnh
    button.translatesAutoresizingMaskIntoConstraints = false
    button.widthAnchor.constraint(equalToConstant: 30).isActive = true
    button.heightAnchor.constraint(equalToConstant: 30).isActive = true
    button.layer.cornerRadius = 15
    
    return button
}

var buttonTextLeft = createButtonNextText(image: "arrow.left")
var buttonTextRight = createButtonNextText(image: "arrow.right")



func viewContainButton(button: UIButton) -> UIView {
    let viewPadd = UIView(frame: .zero)
    viewPadd.backgroundColor = colorAlpha(color: .secondarySystemBackground, number: 0.77)
    viewPadd.layer.cornerRadius = 20
    viewPadd.translatesAutoresizingMaskIntoConstraints = false
    viewPadd.heightAnchor.constraint(equalToConstant: 40).isActive = true
    viewPadd.widthAnchor.constraint(equalToConstant: 40).isActive = true
    viewPadd.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo:  viewPadd.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: viewPadd.centerYAnchor).isActive = true
    return viewPadd
}
/**
 create StackView containt buttons change text
 */

var viewLeft = viewContainButton(button: buttonTextLeft)

var viewRight = viewContainButton(button: buttonTextRight)

func ViewContainButtonChangText(view: UIView) {
    
    
    
    //    view.addSubview(buttonTextLeft)
    //    view.addSubview(buttontextRight)
    
    view.addSubview(viewLeft)
    view.addSubview(viewRight)
    
    let count = view.frame.height / 2
    
    viewLeft.translatesAutoresizingMaskIntoConstraints = false
    viewLeft.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -count).isActive = true
    viewLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    viewRight.translatesAutoresizingMaskIntoConstraints = false
    viewRight.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -count).isActive = true
    viewRight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
}



/**
 add 3 button Status by StackView at buttom view
 */

let viewContain: UIStackView = {
    let stack = UIStackView(arrangedSubviews: arrayButton)
    stack.axis = .horizontal
    stack.spacing = 20
    stack.layoutMargins = UIEdgeInsets(top: 10, left: 25, bottom: 5, right: 25)
    stack.isLayoutMarginsRelativeArrangement = true
    stack.distribution = .fillEqually
    return stack
}()

func ViewConntainButtonStatus(view: UIView) {
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


func clickClosedMenu(view: UIView) -> UIButton {
    let button = UIButton(frame: .zero)
    button.setTitle("CLOSE", for: .normal)
    button.setTitleColor(.black, for: .normal)
    view.addSubview(button)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 115).isActive = true
    button.widthAnchor.constraint(equalToConstant: 70).isActive = true
    button.heightAnchor.constraint(equalToConstant: 30).isActive = true
    return button
}



func viewImageOrColor() -> UIView {
    let viewConntainImage = UIView(frame: .zero)
    viewConntainImage.layer.cornerRadius = 18
    
    viewConntainImage.translatesAutoresizingMaskIntoConstraints = false
    viewConntainImage.heightAnchor.constraint(equalToConstant: 36).isActive = true
    viewConntainImage.widthAnchor.constraint(equalToConstant: 36).isActive = true
    viewConntainImage.backgroundColor = .white
    return viewConntainImage
}


var viewTextAa = viewImageOrColor()
var viewColorGradient = viewImageOrColor()

func viewContainViewImageOrColor(view: UIView) {
    view.addSubview(viewTextAa)
    view.addSubview(viewColorGradient)
    // AutoLayOut for LableView viewTextAa
    viewTextAa.translatesAutoresizingMaskIntoConstraints = false
    viewTextAa.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    viewTextAa.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -128).isActive = true
    // AutoLayOut for LableView viewColorGradient
    viewColorGradient.translatesAutoresizingMaskIntoConstraints = false
    viewColorGradient.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    viewColorGradient.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -128).isActive = true
    
    
    // create/ update Lable for func viewContainViewImageOrColor()
    let lableView = UILabel(frame: .zero)
    lableView.text = "Aa"
    lableView.textColor = .black
    lableView.textAlignment = .center
    lableView.font = .boldSystemFont(ofSize: 15)
    viewTextAa.addSubview(lableView)
    
    lableView.translatesAutoresizingMaskIntoConstraints = false
    lableView.topAnchor.constraint(equalTo: viewTextAa.topAnchor, constant: 5).isActive = true
    lableView.leadingAnchor.constraint(equalTo: viewTextAa.leadingAnchor, constant: 5).isActive = true
    lableView.trailingAnchor.constraint(equalTo: viewTextAa.trailingAnchor, constant: -5).isActive = true
    lableView.bottomAnchor.constraint(equalTo: viewTextAa.bottomAnchor, constant: -5).isActive = true
    
    
    let viewColor = UIView(frame: .zero)
    
    viewColor.layer.cornerRadius = 14
    DispatchQueue.main.async {
        backgroundGradientColor(view: viewColor, color: [UIColor(red: 0.97, green: 0.59, blue: 0.78, alpha: 1.00).cgColor, UIColor(red: 0.38, green: 0.43, blue: 1.00, alpha: 1.00).cgColor])
    }
    viewColorGradient.addSubview(viewColor)
    
    viewColor.translatesAutoresizingMaskIntoConstraints = false
    viewColor.topAnchor.constraint(equalTo: viewColorGradient.topAnchor, constant: 4).isActive = true
    viewColor.leadingAnchor.constraint(equalTo: viewColorGradient.leadingAnchor, constant: 4).isActive = true
    viewColor.trailingAnchor.constraint(equalTo: viewColorGradient.trailingAnchor, constant: -4).isActive = true
    viewColor.bottomAnchor.constraint(equalTo: viewColorGradient.bottomAnchor, constant: -4).isActive = true
    

}
