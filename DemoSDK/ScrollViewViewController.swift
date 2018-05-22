//
//  ScrollViewViewController.swift
//  DemoSDK
//
//  Created by kevin on 2018/5/19.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class ScrollViewViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myImageView: UIImageView!
    
    var scrollViewImage: UIImage?
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myImageView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = scrollViewImage
        myImageView.contentMode = UIViewContentMode.scaleAspectFit
        myScrollView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
