//
//  Helpers.swift
//  TimeBarComponent
//
//  Created by PhongLe on 11/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class DateHelper {
    
    static func date(from string: String)-> Date{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateFormater.date(from: string)!
    }
    
    static func string(from date: Date)-> String{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "E HH:mm a"
        return dateFormater.string(from: date)
    }
}
class ReadData {
    static func readJson(completion: @escaping ([String: Any])->Void) {
        do {
            if let file = Bundle.main.url(forResource: "content_page", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    completion(object)
                } else if let object = json as? [Any] {
                    
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
extension UIView {
    
    
    /// Set some atribute for layout of this UIView (UIImage, UIButton, UITextFeild ...)
    ///
    /// - Parameters:
    ///   - radiusPerHeight: Exemple: the value equal 5
    ///     then radius = (self.bounds.size.height / 5)
    ///   - borderWidth: Set line width for border
    ///   - borderColor: Set color for border
    /// - Returns: return self, you can convert it to any type line UIView (ex: UIImage, UIButton...)
    func addRadus(radiusPerHeight: CGFloat, borderWidth: CGFloat?, borderColor: CGColor?) -> UIView {
        
        if let borderWidth = borderWidth {
            self.layer.borderWidth = borderWidth
        }
        if let borderColor = borderColor {
            self.layer.borderColor = borderColor
        }
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.bounds.size.height / radiusPerHeight
        self.clipsToBounds = true
        return self
    }
}
