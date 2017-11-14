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

    var list = [TimeDisplay]()
    var timeDisplayChoosed = [ProgramMdl]()
    var listProgram = [(channel: String, program: ProgramModel)]()
    
    // ThumbView's element
    let thumbViewContainer: UIView = {
        var thumb = UIView()
        thumb.backgroundColor = UIColor.white
        thumb.frame = CGRect(x: 0, y: 100, width: 150, height: 40)
        thumb.alpha = 0.3
        return thumb
    }()
    let thumbViewTime: UILabel = {
        var label = UILabel()
        label.text = "🕐"
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
        ReadData.readJson { (dict) in
            let datas = dict["datas"] as! [Any]
            for time in datas {
                let timeDisplay = time as! [String: Any]
                self.list.append( TimeDisplay.init(json: timeDisplay))
            }
        }
        // subView manager
        setupView()
        // After load datasource successfully
        thumbViewTime.text = DateHelper.string(from: minTime)
        
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
        let total = limited.bot - limited.top
        let timeTotal = maxTime.timeIntervalSince(minTime)
        
        let translation = panGesture.translation(in: self.view)
        let centerY = panGesture.view!.center.y
        
        let position = centerY - limited.top
        
        let percent = position / total
        let timeChanged: Int = Int(CGFloat(timeTotal) * percent)
        let t = Calendar.current.date(byAdding: .second, value: timeChanged, to: minTime)
        
        
        if centerY <= limited.top {
            panGesture.view!.center = CGPoint(x: panGesture.view!.center.x, y: limited.top + 1)
        }else if centerY >= limited.bot{
            panGesture.view!.center = CGPoint(x: panGesture.view!.center.x, y: limited.bot - 1)
        }else{
            panGesture.view!.center = CGPoint(x: panGesture.view!.center.x, y: centerY + translation.y)
        }
        
        switch panGesture.state {
        case .began:
            UIView.animate(withDuration: 0.3, animations: {
                self.thumbViewContainer.alpha = 1
            })        case .changed:
            thumbViewTime.text = "\(DateHelper.string(from: t!))"
        case .ended:
            
            print("ended")
            
            print("time changed: \(DateHelper.string(from: t!))")
            
            for time in list {
                let nextTimeDisplay = Calendar.current.date(byAdding: .hour, value: 1, to: time.time!)
                if (t?.compare(greaterThan: time.time!))! && (t?.compare(lessThan: nextTimeDisplay!))! {
                    timeDisplayChoosed = time.programs
                    self.collectionView?.reloadData()
                }
            }
            
            UIView.animate(withDuration: 0.3, animations: {
                self.thumbViewContainer.alpha = 0.3
            })
            
        default:
            ()
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
        
        return timeDisplayChoosed.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChannelCell
        // Configure the cell
        cell.channelName.text = timeDisplayChoosed[indexPath.row].channelImageURL
        cell.programName.text = timeDisplayChoosed[indexPath.row].title
        
        if let imgDownload = Downloader.downloadImageWithURL(timeDisplayChoosed[indexPath.row].imageURL) {
            OperationQueue.main.addOperation({
                cell.thumbnailView.image = imgDownload
            })
        }
        if let imgDownload = Downloader.downloadImageWithURL(timeDisplayChoosed[indexPath.row].channelImageURL) {
            OperationQueue.main.addOperation({
                cell.channelImage.image = imgDownload
            })
        }
//
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}


