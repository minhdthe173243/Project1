import UIKit


var containtFavorite: Result! = Result(data: [])
var arrayTextFavourite: [UILabel] = []
/**
 call Func when click on Button Favourite ->  add ResultItems into Arry containtFavorite  -> show list text Favourite at FavouriteController
 */
func contantTextFavorite(index: ResultItems){
    if var favorite = containtFavorite?.data {
        if !favorite.contains(where: { $0.id == index.id  }) {
            favorite.append(index)
            containtFavorite.data = favorite
        }
    }
    print("ContainTextClick \(containtFavorite.data.count)")
}


func removeContainTextFavorite(index: ResultItems) {
    if var favorite = containtFavorite?.data,  favorite.count > 0 {
        favorite.removeAll { $0.id == index.id }
        containtFavorite?.data = favorite
    }
}


func textFavourite(view: UIView) {
    if let favorite = containtFavorite?.data, favorite.count > 0 {
        for i in 0...favorite.count-1 {
            let text = lableView()
            text.translatesAutoresizingMaskIntoConstraints = false
            text.widthAnchor.constraint(equalToConstant: 200).isActive = true
            text.heightAnchor.constraint(equalToConstant: 80).isActive = true
            text.layer.cornerRadius = 20
            text.backgroundColor = .green
            text.text = favorite[i].quote
            arrayTextFavourite.append(text)
        }
        
        print("araycount \(arrayTextFavourite.count)")
    }
    
    
    let stack = UIStackView(arrangedSubviews: arrayTextFavourite)
    stack.axis = .vertical
    stack.distribution = .equalSpacing
    stack.isLayoutMarginsRelativeArrangement = true
    // stack.layoutMargins = UIEdgeInsets(top: 100, left: 40, bottom: 100, right: 40)
    stack.spacing = 10
    arrayTextFavourite = []
    
    
    view.addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.layer.cornerRadius = 30
    stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
    stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    //    stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    stack.heightAnchor.constraint(equalToConstant: CGFloat(80 * containtFavorite.data.count + 10 * (containtFavorite.data.count-1))).isActive = true
}


