//
//  ViewController.swift
//  Autolayout-CompressionRessistance
//
//  Created by Ante Karin on 29/04/16.
//  Copyright © 2016 Compañía de AK. All rights reserved.
//

import UIKit

let layoutWhichDoesntSuckIdentifier = "TransactionCellWhichDoesntSuck"
let layoutWhichSucksIdentifier = "TransactionCellWhichSucks"

class ViewController: UITableViewController {

    var currentState = 0

    let transactionTitles = ["Plaćanje po računu broj 12", "Karte za na Mjesec", "Internet usluge za mjesec 04/16", "Mobitel ajfon šes es najnoviji", "Kuća na moru veća za kat od susjedove"]
    let transactionAmounts = ["326,22", "100.743.619.231,01", "500", "100", "4,000,000.00"]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - UITableView -

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionTitles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var identifier = layoutWhichSucksIdentifier
        if currentState == 1 {
            identifier = layoutWhichDoesntSuckIdentifier
        }

        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! TransactionCell

        cell.titleLabel.text = transactionTitles[indexPath.row]
        cell.amountLabel.text = transactionAmounts[indexPath.row].stringByAppendingString(" EUR")

        return cell

    }
    
    @IBAction func poorLayoutHandler(sender: AnyObject) {
        currentState = 0
        tableView.reloadData()
    }

    @IBAction func goodLayoutHandler(sender: AnyObject) {
        currentState = 1
        tableView.reloadData()
    }
}

