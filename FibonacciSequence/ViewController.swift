//
//  ViewController.swift
//  FibonacciSequence F_n = F_{n-1} + F_{n-2}
//
//  Created by Chuck Gaffney on 10/30/14.
//  Copyright (c) 2014 Chuck Gaffney. All rights reserved.
//

import UIKit

//Global Array that will hold the Fibonacci number
var fibNumberArray: [Int] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var textField = UITextField()

    var num: Int = 0
    
    //class object
    var fib : Fibonacci?
    
    //Sequence generator of type Int
    var fibGenerator : GeneratorOf<Int>?
    
    //StoryBoard Vars
    @IBOutlet var tableView: UITableView!
        
    @IBOutlet var fibLimitNum: UITextField!

    @IBAction func endText(sender: AnyObject) {
        
        textField = sender as UITextField
        
        println(textField.text)
        
        //displayFibonacci()
        
        println("Number entered")
    }
    
    
    //opens the app and sets the TableView to the default value
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    //Button listeners
    @IBAction func slowSequenceSelected(sender: UIButton) {
        
        displayFibonacciSlow()
        
    }
    
    @IBAction func fastSequenceSelected(sender: UIButton) {
        
        displayFibonacciFast()
        
    }
    
    //Fibonacci class calls
    
    //slower Generator Sequence Method
    func displayFibonacciSlow(){
        
        resetFib()
        
        //does an early check if the textfield is convertable to an Int; ie: all numbers entered
        //'if let' is a unique functionality of Swift for readable, early case checking
        if let num = textField.text.toInt(){
            
            //tells user it's formulating the numbers
            textField.text = "Calculating..."
            
            
            //create the Fibonacci class object
            fibGenerator = Fibonacci(limit: num).generate()
            
            for _ in 0...num{
            fibGenerator?.next()
            }
            
        }
            
            //display error if no numbers where entered
        else{
            textField.text = "ERROR"
        }
        
        //refreashes the table
        tableView.reloadData()
        
        //schedule the remvoing the "Calculating" text
        let tempDelay = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("clearText"), userInfo: nil, repeats: false)
        
        
        
    }
    
    //faster simple recursive call method
    func displayFibonacciFast(){
        
        resetFib()
        
        if let num = textField.text.toInt(){
            
            //tells user it's formulating the numbers
            textField.text = "Calculating..."
            
            fib = Fibonacci()
            
            fib?.simpleRecursive(0, next: 1, limit: num)
        }
        
        //display error if no numbers where entered
        else{
            textField.text = "ERROR"
        }
        
        //refreashes the table
        tableView.reloadData()
        
        //schedule the remvoing the "Calculating" text
        let tempDelay = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("clearText"), userInfo: nil, repeats: false)

        
    }
    
    //resets the arrays and Sequence object; clears data for ARC
    func resetFib(){
        fibNumberArray.removeAll(keepCapacity: false)
        fibGenerator = nil
        fib = nil
    }
   
    //TableView functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fibNumberArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = String(fibNumberArray[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("You selected cell #\(indexPath.row)!")
    }
    
    func clearText(){
        
        textField.text = ""
    }

    
    // Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

