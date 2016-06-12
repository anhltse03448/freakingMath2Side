//
//  ViewController.swift
//  FreakingMath2Side
//
//  Created by Anh Tuan on 6/6/16.
//  Copyright © 2016 Anh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressTime : UIProgressView!
    let NUM_OF_BT = 1000
    let time : Double = 10 //second
    var count : Double = 0
    @IBOutlet weak var viewEndGame: UIView!
    
    var period : Double = 0.01
    var timer = NSTimer()
    
    var arrBt = [btModel]()
    var currentBt : Int?
    
    var score2 : Int = 0
    
    @IBOutlet weak var btnTrue : UIButton!
    @IBOutlet weak var btnFalse : UIButton!
    @IBOutlet weak var lblMath : UILabel!
    @IBOutlet weak var lblScore : UILabel!
    
    @IBOutlet weak var viewPlay2: UIView!
    @IBOutlet weak var viewPlay1: UIView!
    
    @IBOutlet weak var btnTrueTop : UIButton!
    @IBOutlet weak var btnFalseTop : UIButton!
    @IBOutlet weak var lblMathTop : UILabel!
    @IBOutlet weak var lblScoreTop : UILabel!
    @IBOutlet weak var progressTimeTop : UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        score2 = 0
        
        viewEndGame.frame.origin.y = 0
        viewEndGame.hidden = true
        if arrBt.count == 0 {
            generateBt()
        }
        
        progressTime.progress = 0
        initTop()
        
        currentBt = 0
        lblMath.text = arrBt[currentBt!].toString()
        lblMathTop.text = arrBt[currentBt!].toString()
        
        
        //startTime()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initTop() {
//        lblMathTop.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
//        btnTrueTop.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
//        btn
        viewPlay2.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
    }
    
    
    
    func generateBt(){
        
        for _ in 0 ..< NUM_OF_BT {
            let first = Int(arc4random_uniform(20))
            let second = Int(arc4random_uniform(20))
            
            let xxx = arc4random_uniform(2)
            var tmphihi : Bool = false
            if xxx == 0 { //false
                tmphihi = false
            }else {
                tmphihi = true
            }
            
            arrBt.append(btModel(first: first, second: second, isTrue: tmphihi))
        }
    }
    
    func startTime(){
        timer = NSTimer.scheduledTimerWithTimeInterval(period, target: self, selector: #selector(ViewController.checkLog), userInfo: nil, repeats: true)
    }
    
    func resetTime(){
        timer.invalidate()
        count = 0
        currentBt = currentBt! + 1
        lblMath.text = arrBt[currentBt!].toString()
        lblScore.text = String(format: "%d", score2)
        
        
        viewPlay1.backgroundColor = UIColor.redColor()
        viewPlay2.backgroundColor = UIColor.redColor()
        
        startTime()
        
    }
    
    func endTime(){
        
    }
    
    func endGame(){
        timer.invalidate()
        btnTrue.enabled = false
        btnFalse.enabled = false
        viewEndGameAnimation()
        
        
    }
    
    func viewEndGameAnimation(){
        
        UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.viewEndGame.hidden = false
            self.viewEndGame.frame.origin.y = self.view.frame.height / 2 - self.viewEndGame.frame.height / 2
            }, completion: nil)
        self.viewEndGame.becomeFirstResponder()
    }        
    
    func checkLog(){
        count += period
        NSLog("\(count)")
        progressTime.progress = Float(count / time)
        if count >= time {
            timer.invalidate()
            endGame()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func btnTouchUp(sender : UIButton){
        if sender == btnTrue {
            if arrBt[currentBt!].isTrue == true {
                score2 = score2 + 1
                resetTime()
            }else {
                endGame()
            }
        }
        else {
            if arrBt[currentBt!].isTrue == true {
                endGame()
            }else {
                resetTime()
            }
        }
        if currentBt == 0 {
            resetTime()
        }
    }
    
    @IBAction func btnReplayGame(sender : UIButton){
        score2 = 0
        arrBt.removeAll()
        generateBt()
        
        resetTime()
        viewEndGame.frame.origin.y = 0
        viewEndGame.hidden = true
        btnTrue.enabled = true
        btnFalse.enabled = true
    }
    
    @IBAction func btnPlayAgainTouchUpInside(sender: AnyObject) {
        NSLog("replay")
    }


}

