//
//  ChannelViewController.swift
//  TimeBarComponent
//
//  Created by PhongLe on 11/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

private let reuseIdentifier = "channelCell"

class ChannelViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    
    // ThumbView's element
    let thumbViewContainer: UIView = {
        var thumb = UIView()
        thumb.backgroundColor = UIColor.white
        thumb.frame = CGRect(x: 0, y: 100, width: 150, height: 40)
        thumb.alpha = 0.5
        return thumb
    }()
    let thumbViewTime: UILabel = {
        var label = UILabel()
        label.text = "Wed 10:26 AM 🕐"
        return label
    }()
    func setupView(){
        
        //setup thumb's subview
        thumbViewContainer.addSubview(thumbViewTime)
        thumbViewContainer.addConstraints(with: "H:|[v0]|", views: thumbViewTime)
        thumbViewContainer.addConstraints(with: "V:|[v0]|", views: thumbViewTime)
        
        //setup self.view
        self.view.addSubview(thumbViewContainer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(ChannelCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // subView manager
        setupView()
        
        createPanGestureRecognizer(targetView: thumbViewContainer)
        
    }
    
    // The Pan Gesture
    func createPanGestureRecognizer(targetView: UIView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(panGesture:)))
        targetView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        let hidght = self.view.bounds.height
        
        var limited: (top: CGFloat, bot: CGFloat) = (0, 0)
        limited.top = hidght / 10
        limited.bot = hidght - hidght / 10
    
        
        let translation = panGesture.translation(in: self.view)
        let centerY = panGesture.view!.center.y
        if centerY <= limited.top {
            panGesture.view!.center = CGPoint(x: panGesture.view!.center.x, y: limited.top + 1)
        }else if centerY >= limited.bot{
            panGesture.view!.center = CGPoint(x: panGesture.view!.center.x, y: limited.bot - 1)
        }else{
            panGesture.view!.center = CGPoint(x: panGesture.view!.center.x, y: centerY + translation.y)
        }
        
        
        panGesture.setTranslation(CGPoint.zero, in: self.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 50
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChannelCell
        // Configure the cell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}


