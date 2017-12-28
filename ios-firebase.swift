{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf200
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green116\blue0;\red255\green255\blue255;\red170\green13\blue145;
\red0\green0\blue0;\red92\green38\blue153;\red63\green110\blue116;\red196\green26\blue22;\red38\green71\blue75;
\red46\green13\blue110;}
{\*\expandedcolortbl;;\csgenericrgb\c0\c45600\c0;\csgenericrgb\c100000\c100000\c100000;\csgenericrgb\c66500\c5200\c56900;
\csgenericrgb\c0\c0\c0;\csgenericrgb\c35900\c14900\c60100;\csgenericrgb\c24700\c43100\c45600;\csgenericrgb\c77000\c10200\c8600;\csgenericrgb\c14900\c27800\c29400;
\csgenericrgb\c18100\c5200\c43100;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab692
\pard\tx692\pardeftab692\pardirnatural\partightenfactor0

\f0\fs28 \cf2 \cb3 //
\f1\fs24 \cf0 \

\f0\fs28 \cf2 //  ViewController.swift
\f1\fs24 \cf0 \

\f0\fs28 \cf2 //  firedata
\f1\fs24 \cf0 \

\f0\fs28 \cf2 //
\f1\fs24 \cf0 \

\f0\fs28 \cf2 //  Created by < this_is_kaushal__/> on 12/29/17.
\f1\fs24 \cf0 \

\f0\fs28 \cf2 //  Copyright \'a9 2017 < this_is_kaushal__/>. All rights reserved.
\f1\fs24 \cf0 \

\f0\fs28 \cf2 //
\f1\fs24 \cf0 \
\

\f0\fs28 \cf4 import\cf5  UIKit
\f1\fs24 \cf0 \

\f0\fs28 \cf4 import\cf5  FirebaseDatabase
\f1\fs24 \cf0 \
\

\f0\fs28 \cf4 class\cf5  ViewController: \cf6 UIViewController\cf5 , \cf6 UITableViewDelegate\cf5 , \cf6 UITableViewDataSource\cf5  \{
\f1\fs24 \cf0 \
\

\f0\fs28 \cf5     \cf4 @IBOutlet\cf5  \cf4 var\cf5  myAlert: \cf6 UILabel\cf5 !
\f1\fs24 \cf0 \

\f0\fs28 \cf5     
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 @IBOutlet\cf5  \cf4 var\cf5  sendDataTxt: \cf6 UITextField\cf5 !
\f1\fs24 \cf0 \

\f0\fs28 \cf5     
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf2 //Empty array
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 var\cf5  myInfoList:[\cf6 String\cf5 ] = []
\f1\fs24 \cf0 \

\f0\fs28 \cf5     
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf2 //Specially for retriving data
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 var\cf5  handle:\cf7 DatabaseHandle\cf5 ?
\f1\fs24 \cf0 \

\f0\fs28 \cf5     
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf2 //to retrive data back
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 @IBOutlet\cf5  \cf4 var\cf5  myTableView: \cf6 UITableView\cf5 !
\f1\fs24 \cf0 \
\

\f0\fs28 \cf5     \cf2 //DatabaseReference i.e myRef
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 var\cf5  ref:\cf7 DatabaseReference\cf5 ?
\f1\fs24 \cf0 \

\f0\fs28 \cf5     
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 @IBAction\cf5  \cf4 func\cf5  btnSend(\cf4 _\cf5  sender: \cf4 Any\cf5 ) \{
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf2 //Finally create a child and push the values from editText
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf4 if\cf5  \cf7 sendDataTxt\cf5 .\cf6 text\cf5  != \cf8 ""\cf5  \{
\f1\fs24 \cf0 \

\f0\fs28 \cf5             
\f1\fs24 \cf0 \

\f0\fs28 \cf5                             \cf2 //.childByAutoId() to push new items to database
\f1\fs24 \cf0 \

\f0\fs28 \cf5          \cf7 ref\cf5 ?.\cf9 child\cf5 (\cf8 "list"\cf5 ).\cf9 child\cf5 (\cf8 "name"\cf5 ).\cf9 setValue\cf5 (\cf7 sendDataTxt\cf5 .\cf6 text\cf5 )
\f1\fs24 \cf0 \

\f0\fs28 \cf5             
\f1\fs24 \cf0 \

\f0\fs28 \cf5          \cf7 sendDataTxt\cf5 .\cf6 text\cf5  = \cf8 ""
\f1\fs24 \cf0 \

\f0\fs28 \cf5             
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \} \cf4 else\cf5  \{
\f1\fs24 \cf0 \

\f0\fs28 \cf5             
\f1\fs24 \cf0 \

\f0\fs28 \cf5             \cf7 myAlert\cf5 .\cf6 text\cf5  = \cf8 "Please fill the entry!"
\f1\fs24 \cf0 \

\f0\fs28 \cf5             
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \}
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \}
\f1\fs24 \cf0 \

\f0\fs28 \cf5     
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf2 //Kind of ListView to get all the items from database
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 func\cf5  tableView(\cf4 _\cf5  tableView: \cf6 UITableView\cf5 , numberOfRowsInSection section: \cf6 Int\cf5 ) -> \cf6 Int\cf5  \{
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf4 return\cf5  \cf7 myInfoList\cf5 .\cf6 count
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \}
\f1\fs24 \cf0 \

\f0\fs28 \cf5     
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 func\cf5  tableView(\cf4 _\cf5  tableView: \cf6 UITableView\cf5 , cellForRowAt indexPath: \cf6 IndexPath\cf5 ) -> \cf6 UITableViewCell\cf5  \{
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf4 let\cf5  cell = \cf6 UITableViewCell\cf5 (style: \cf6 UITableViewCellStyle\cf5 .\cf4 default\cf5 , reuseIdentifier: \cf8 "cell"\cf5 )
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5         cell.\cf6 textLabel\cf5 ?.\cf6 text\cf5  = \cf7 myInfoList\cf5 [indexPath.\cf6 row\cf5 ]
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf4 return\cf5  cell
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \}
\f1\fs24 \cf0 \

\f0\fs28 \cf5     
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \cf4 override\cf5  \cf4 func\cf5  viewDidLoad() \{
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf4 super\cf5 .\cf10 viewDidLoad\cf5 ()
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf2 //Like android myRef = FirebaseDatabase.getInstance().getReference;
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf7 ref\cf5  = \cf7 Database\cf5 .\cf9 database\cf5 ().\cf9 reference\cf5 ()
\f1\fs24 \cf0 \

\f0\fs28 \cf5                                                 \cf2 //here use possible value like.childAdd etc
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf7 handle\cf5  = \cf7 ref\cf5 ?.\cf9 child\cf5 (\cf8 "list"\cf5 ).\cf9 child\cf5 (\cf8 "name"\cf5 ).\cf9 observe\cf5 (.\cf9 value\cf5 , with: \{ (snapshot) \cf4 in
\f1\fs24 \cf0 \

\f0\fs28 \cf5             
\f1\fs24 \cf0 \

\f0\fs28 \cf5             \cf4 if\cf5  \cf4 let\cf5  item = snapshot.\cf7 value\cf5  \cf4 as\cf5 ?\cf6 String\cf5  \{
\f1\fs24 \cf0 \

\f0\fs28 \cf5                 
\f1\fs24 \cf0 \

\f0\fs28 \cf5                 \cf2 //self.myInfoList.append(item)
\f1\fs24 \cf0 \

\f0\fs28 \cf5                 
\f1\fs24 \cf0 \

\f0\fs28 \cf5                 \cf2 //self.myTableView.reloadData()
\f1\fs24 \cf0 \

\f0\fs28 \cf5                 
\f1\fs24 \cf0 \

\f0\fs28 \cf5                 \cf4 self\cf5 .\cf7 myAlert\cf5 .\cf6 text\cf5  = item
\f1\fs24 \cf0 \

\f0\fs28 \cf5                 
\f1\fs24 \cf0 \

\f0\fs28 \cf5             \}
\f1\fs24 \cf0 \

\f0\fs28 \cf5             
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \})
\f1\fs24 \cf0 \

\f0\fs28 \cf5         
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \}
\f1\fs24 \cf0 \
\

\f0\fs28 \cf5     \cf4 override\cf5  \cf4 func\cf5  didReceiveMemoryWarning() \{
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf4 super\cf5 .\cf10 didReceiveMemoryWarning\cf5 ()
\f1\fs24 \cf0 \

\f0\fs28 \cf5         \cf2 // Dispose of any resources that can be recreated.
\f1\fs24 \cf0 \

\f0\fs28 \cf5     \}
\f1\fs24 \cf0 \
\
\

\f0\fs28 \cf5 \}
\f1\fs24 \cf0 \
\
}