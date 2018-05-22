//
//  MyCollectionViewController.swift
//  DemoSDK
//
//  Created by kevin on 2018/5/18.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var collectionImage: UIImage?
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        
        cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
        
        return cell
    }
    

    var fullScreenSize: CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullScreenSize = UIScreen.main.bounds.size
        
        // 建立 UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        // 設置每一行的間距
        layout.minimumLineSpacing = 5
        
        // 設置每個 cell 的尺寸
        layout.itemSize = CGSize(
           width: CGFloat(fullScreenSize.width)/3 - 10.0, height: CGFloat(fullScreenSize.width)/3 - 10.0)
        
        let myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 20, width: fullScreenSize.width, height: fullScreenSize.height), collectionViewLayout: layout)
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        
        myCollectionView.backgroundColor = UIColor.white
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        self.view.addSubview(myCollectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionImage = UIImage(named: "\(indexPath.item + 1)")
        performSegue(withIdentifier: "ScrollViewSegue", sender: nil)
    }
    
    @IBAction func unwindToMultipleChoicePage(segue: UIStoryboardSegue){
        collectionImage = nil
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as? ScrollViewViewController
        controller?.scrollViewImage = collectionImage
    }
    

}
