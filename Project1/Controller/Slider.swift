import UIKit

/**
 create slider change size text desctription
 */
func silderView() -> UISlider {
    let slider = UISlider()
    slider.minimumValue = 18
    slider.maximumValue = 28
    slider.value = 18
    return slider
}

var slider = silderView()

/**
 auto Layout silder
 */
func containSilderView(view: UIView) {
    view.addSubview(slider)
    slider.translatesAutoresizingMaskIntoConstraints = false
    slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -125).isActive = true
    slider.widthAnchor.constraint(equalToConstant: 200).isActive = true
    slider.heightAnchor.constraint(equalToConstant: 50).isActive = true
    slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
}




