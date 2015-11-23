//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Karsten Gresch on 17.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
  
  @IBOutlet weak var webView: UIWebView?

    override func viewDidLoad() {
        super.viewDidLoad()

      if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
        if let htmlData = NSData(contentsOfFile: htmlFile) {
          let baseUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
          webView?.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
        }
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  @IBAction func close(sender: UIButton) {
    dismissViewControllerAnimated(true, completion: nil )
  }

}
