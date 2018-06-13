//
//  ViewController.swift
//  Train pass 2
//
//  Created by Chris Toppin on 6/7/18.
//  Copyright © 2018 Gaming Arts. All rights reserved.
//

// Swift Languange
import UIKit

//Kerning Text
@IBDesignable
class KerningLabel: UILabel {
    
    @IBInspectable var kerning: CGFloat = 0.0 {
        didSet {
            if attributedText?.length == nil { return }
            
            let attrStr = NSMutableAttributedString(attributedString: attributedText!)
            let range = NSMakeRange(0, attributedText!.length)
            attrStr.addAttributes([NSAttributedStringKey.kern: kerning], range: range)
            attributedText = attrStr
        }
    }
}

class ViewController: UIViewController {
    
    //ColorBarOutlet
    @IBOutlet weak var flashBar: UIView!
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //FlashBarA
        flashBar.alpha = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //
    
    //Time and Date
    @IBOutlet weak var TimeDate: UILabel!
    
    //update Clock
    var timer = Timer()
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.updateClock), userInfo: nil, repeats: true)
    }
    
    @objc func updateClock() {
        
        //Time n Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "K:mm:ss a MM/dd/yy"
        let dateString = "\(dateFormatter.string(from: Date() as Date))"
        TimeDate.text = String(dateString)
        
        // Time n Date Stroke
        let string = "\(dateFormatter.string(from: Date() as Date))"
        let attributedString = NSMutableAttributedString(string: string)
        
        attributedString.addAttribute(NSAttributedStringKey.strokeColor, value: UIColor.black, range: NSRange(location: 0, length: 20))
        
        attributedString.addAttribute(NSAttributedStringKey.strokeWidth, value: -1.0, range: NSRange(location: 0, length: 20))
        
        self.TimeDate.attributedText = attributedString
    
    }
    
    //ButtonAction
    
    //Time n Date Animation
    @IBAction func activateButton(_ sender: UIButton) {
    
        UIView.animate(withDuration: 2.5, animations:{self.TimeDate.frame.origin.x += 125})
        {_ in
            UIView.animateKeyframes(withDuration: 2.5, delay: 00, options: [.autoreverse, .repeat], animations: {
                self.TimeDate.frame.origin.x -= 125})
            
        }
        
        //flashBarAnimation
        UIView.animate(withDuration: 0.5, animations: {self.flashBar.alpha = 0.5})
        {_ in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.autoreverse, .repeat], animations: {self.flashBar.alpha = 0})
            
        }
    }
    
}
