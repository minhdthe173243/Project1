import UIKit

func backgroundGradientColor(view: UIView, color: [CGColor]) {
    let gradient = CAGradientLayer()
    gradient.colors = color
    gradient.locations = [0.0, 1.0]
    gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
    
    gradient.frame = view.bounds
    view.layer.insertSublayer(gradient, at: 0)
    gradient.cornerRadius = view.layer.cornerRadius
    
}


func colorAlpha(color: UIColor,number: Float) -> UIColor  {
    return color.withAlphaComponent(CGFloat(number))
}









