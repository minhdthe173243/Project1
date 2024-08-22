import UIKit


var result: Result?
/*
 show lable containt text up Screen
 */
func lableView() -> UILabel  {
    let label = UILabel()
    label.layer.masksToBounds = true
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = .white
    return label
}

var titleText = lableView()
var descriptionText = lableView()
var noteText = lableView()


/**
 codable json to data
 */

func disPlayLableViewJSON() {
    guard let path = Bundle.main.path(forResource: "quotes (1)",
                                      ofType: "json") else { return  }
    let url = URL(fileURLWithPath: path)
    do {
        let jsonData = try Data(contentsOf: url)
        result = try JSONDecoder().decode(Result.self, from: jsonData)
        disPlayText(index: 0)
    } catch {
        print("Error! - \(error)")
    }
}


/**
 display text each index after click button next / back
 */
func disPlayText(index: Int) {
    let firstItem = result!.data[index]
    print(firstItem.anime)
    titleText.text = firstItem.anime
    descriptionText.text = firstItem.quote
    noteText.text = "\(firstItem.name). \(firstItem.id)"
}


//AutoLayOut for LableView follow view by StackView
func setupLabelConstraints(view: UIView) {
    titleText.translatesAutoresizingMaskIntoConstraints = false
    titleText.widthAnchor.constraint(equalToConstant: 100).isActive = true
    titleText.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        titleText.backgroundColor = .green
    descriptionText.translatesAutoresizingMaskIntoConstraints = false
    descriptionText.widthAnchor.constraint(equalToConstant: 100).isActive = true
    descriptionText.heightAnchor.constraint(equalToConstant: 380).isActive = true
    //    descriptionText.backgroundColor = .redred
    noteText.translatesAutoresizingMaskIntoConstraints = false
    noteText.widthAnchor.constraint(equalToConstant: 100).isActive = true
    noteText.heightAnchor.constraint(equalToConstant: 50).isActive = true
    //    noteText.backgroundColor = .brown
    
    let stackView = UIStackView(arrangedSubviews: [titleText, descriptionText, noteText])
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.layoutMargins = UIEdgeInsets(top: 100, left: 40, bottom: 100, right: 40)
    stackView.spacing = 5
    
    view.addSubview(stackView)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.layer.cornerRadius = 30
    stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
    stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -190).isActive = true
    
    stackView.layer.masksToBounds = false
    stackView.clipsToBounds = false
    
    DispatchQueue.main.async {
        backgroundGradientColor(view: stackView, color: [UIColor(red: 0.97, green: 0.59, blue: 0.78, alpha: 1.00).cgColor, UIColor(red: 0.38, green: 0.43, blue: 1.00, alpha: 1.00).cgColor])
    }

}

