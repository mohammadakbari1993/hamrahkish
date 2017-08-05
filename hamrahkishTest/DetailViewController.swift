//
//  DetailViewController.swift
//  hamrahkishTest
//
//  Created by MacBook Pro on 1396/5/13 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIWebViewDelegate {
    
        @IBOutlet weak var detailid: UILabel!
    
    @IBOutlet weak var detailtitle: UILabel!
    
    @IBOutlet weak var detailcategory: UILabel!
    
    @IBOutlet weak var detaildescription: UILabel!
    
    @IBOutlet weak var detailvideo: UILabel!
    
    @IBOutlet weak var MywebView: UIWebView!

    
    

    
    var sentData1:String!
    var sentData2:String!
    var sentData3:String!
    var sentData4:String!
    var sentData5:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
  
        detailid.text = sentData1
        detailtitle.text = sentData2
        detailcategory.text = sentData3
        detaildescription.text = sentData4
        detailvideo.text = sentData5
        let url2 : String = sentData5
        print("yor video URL is :" , url2)
        let url = URL(string: url2)
        MywebView.loadRequest(URLRequest(url:url!))
        


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}




















