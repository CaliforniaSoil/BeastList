//
//  ViewController.swift
//  BeastList
//
//  Created by Admin on 11/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    var tasks = [""]
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        tasks.append(taskTextField.text!)
        ableView.reloadData()
        taskTextField.text = ""
    }
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var ableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ableView.dataSource = self
        ableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
extension ViewController: UITableViewDataSource {
    func tableView(_ ableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ ableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    func tableView(_ ableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        ableView.reloadData()
    }
    
}
