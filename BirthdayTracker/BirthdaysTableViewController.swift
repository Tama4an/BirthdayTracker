//
//  BirthdaysTableViewController.swift
//  BirthdayTracker
//
//  Created by Valentyn Kotenko on 8/5/24.
//

import UIKit

class BirthdaysTableViewController: UITableViewController, AddBirthdayViewControllerDelegate {

    var birthdays = [Birthday]()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdays.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "birthdayCellIdentifier", for: indexPath)
        let birthday = birthdays[indexPath.row]
        
        cell.textLabel?.text = birthday.firstName + " " + birthday.lastName
        cell.detailTextLabel?.text = dateFormatter.string(from: birthday.birthdate)
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let addBirthdayViewController = navigationController.topViewController as! AddBirthdayViewController
        addBirthdayViewController.delegate = self
    }
    
    // MARK: - AddBirthdayViewControllerDelegate
    func addBirthdayViewController(_addBirthdayViewController: AddBirthdayViewController, didAddBirthday birthday: Birthday) {
        
        birthdays.append(birthday)
        tableView.reloadData()
        
    }

}
