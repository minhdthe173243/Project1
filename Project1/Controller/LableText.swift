

import UIKit

var lableView: UILabel = {
    var label = UILabel()
    label.backgroundColor = .red
    label.layer.cornerRadius = 30
    label.layer.masksToBounds = true
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
}()


func disPlayLableViewJSON() {
    guard let path = Bundle.main.path(forResource: "quotes (1)",
                                      ofType: "json") else { return  }
    let url = URL(fileURLWithPath: path)
    
    var result: Result?
    do {
        let jsonData = try Data(contentsOf: url)
        
        result = try JSONDecoder().decode(Result.self, from: jsonData)
        let firstItem = result?.data.first
        lableView.text = firstItem?.quote
        lableView.textColor = .white
        
        
    } catch {
        print("Error! - \(error)")
    }
    
}



