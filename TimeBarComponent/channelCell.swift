//
//  channelCell.swift
//  TimeBarComponent
//
//  Created by PhongLe on 11/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class ChannelCell: BaseCell {
    
    // Element
    // image
    let thumbnailView: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = UIColor.random()
        
        return image
    }()
    
    // title
    let programName: UILabel = {
        var label = UILabel()
        label.text = "program's name"
        label.textColor = UIColor.white
        
        return label
    }()
    let channelName: UILabel = {
        var label = UILabel()
        label.text = "channel's name"
        label.textColor = UIColor.white
        
        return label
    }()
    
    override func setupViews() {
//        frame.size = CGSize(width: 200, height: 100)
        // add subview to container
        addSubview(programName)
        addSubview(thumbnailView)
        addSubview(channelName)
        
        // setup constraint for element
        self.addConstraints(with: "H:|-4-[v0]-4-|", views: thumbnailView)
        self.addConstraints(with: "H:|-4-[v0]-4-|", views: programName)
        self.addConstraints(with: "H:|-4-[v0]-4-|", views: channelName)
        self.addConstraints(with: "V:|-4-[v2(26)]-[v0]-[v1(26)]-4-|", views: thumbnailView, programName, channelName)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
extension UIView {
    func addConstraints(with format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
