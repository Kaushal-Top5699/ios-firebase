//
//  ViewController.swift
//  firedata
//
//  Created by < this_is_kaushal__/> on 12/29/17.
//  Copyright © 2017 < this_is_kaushal__/>. All rights reserved.

/*  This project also contains a TableView if the items are pushed to database by creating childByAutoID() method before
  setValue("Your Value"). If you are familier with Android Development then this will be easily understood by you. */

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var myAlert: UILabel!
    
    @IBOutlet var sendDataTxt: UITextField!
    
    //Empty array
    var myInfoList:[String] = []
    
    //Specially for retriving data
    var handle:DatabaseHandle?
    
    //to retrive data back
    @IBOutlet var myTableView: UITableView!

    //DatabaseReference i.e myRef
    var ref:DatabaseReference?
    
    @IBAction func btnSend(_ sender: Any) {
        
        //Finally create a child and push the values from editText
        if sendDataTxt.text != "" {
            
                            //.childByAutoId() to push new items to database
         ref?.child("list").child("name").setValue(sendDataTxt.text)
            
         sendDataTxt.text = ""
            
        } else {
            
            myAlert.text = "Please fill the entry!"
            
        }
        
    }
    
    //Kind of ListView to get all the items from database
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myInfoList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = myInfoList[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Like android myRef = FirebaseDatabase.getInstance().getReference;
        ref = Database.database().reference()
                                                //here use possible value like.childAdd etc
        handle = ref?.child("list").child("name").observe(.value, with: { (snapshot) in
            
            if let item = snapshot.value as?String {
                
                //self.myInfoList.append(item)
                
                //self.myTableView.reloadData()
                
                self.myAlert.text = item
                
            }
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

