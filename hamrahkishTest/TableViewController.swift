//
//  TableViewController.swift
//  hamrahkishTest
//
//  Created by MacBook Pro on 1396/5/13 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    
    
    
    var Id : [String] = []
    var Tiitle : [String] = []
    var Category : [String] = []
    var Descriptions : [String] = []
    var Video : [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
       
        let url = URL(string : "http://www.almachii.ir/products.php")
        
        do {
            let data = try Data(contentsOf : url!)
            let info = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            
            print("yori json is :" , info)
            
            if let json = info["productsResult"] {
                for index in 0...json.count-1{
                    
                    let aObject = json[index] as! [String : AnyObject]
                    
                    Id.append(aObject["id"] as! String)
                    Tiitle.append(aObject["title"] as! String)
                    Category.append(aObject["category"] as! String)
                    Descriptions.append(aObject["description"] as! String)
                    Video.append(aObject["video"] as! String)
                }
            }
        }
        catch{
            print("error")
        }


    
        
        
        
        
    }
    
    func sideMenus () {
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Id.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell

        cell.Lblid.text = Id[indexPath.row]
        cell.Lbltitle.text = Tiitle[indexPath.row]
        cell.Lblcategory.text = Category[indexPath.row]
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "DetailView") {
            
            let VC = segue.destination as! DetailViewController
            
            if let indexpath = self.tableView.indexPathForSelectedRow {
                let id = Id[indexpath.row] as String
                VC.sentData1 = id
                
                let title = Tiitle[indexpath.row] as String
                VC.sentData2 = title
                
                let category = Category[indexpath.row] as String
                VC.sentData3 = category
                
                let description = Descriptions[indexpath.row] as String
                VC.sentData4 = description
                
                let video = Video[indexpath.row] as String
                VC.sentData5 = video
            }
            
        }
   
    }

}
