//
//  StartViewController.swift
//  FreakingMath2Side
//
//  Created by Anh Tuan on 6/9/16.
//  Copyright © 2016 Anh Tuan. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startGame(sender : AnyObject){
        let dest = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        self.navigationController?.pushViewController(dest, animated: true)
     
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
