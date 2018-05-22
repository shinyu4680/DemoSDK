//
//  FirstViewController.swift
//  DemoSDK
//
//  Created by kevin on 2018/5/15.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

//protocol UITextViewDelegate: class{
//   func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
//}

class FirstViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var inpurTextView: UITextView!
    @IBOutlet weak var textViewCountLabel: UILabel!
    weak var delegate: UITextViewDelegate?
    
    
    // MARK: set maximum text.cout
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = textView.text
        let numberOfText = newText!.count
        
        if (range.length + range.location > numberOfText){
            return false
        }
        let newLength = numberOfText + text.count - range.length
        return newLength <= 10
    }
    
    // MARK: strat typeing with blank
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        textView.text = ""
        let numberOfText = textView.text.count
        textViewCountLabel.text = "\(numberOfText)"
        return true
    }
    
    // MARK: show the text count on label
    func textViewDidChange(_ textView: UITextView) {
        let numberOfText = textView.text.count
        textViewCountLabel.text = "\(numberOfText)"
    }
    
    // MARK: set delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inpurTextView.delegate = self
    }
    
    @IBAction func viewTapped(_ sender: Any){
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

