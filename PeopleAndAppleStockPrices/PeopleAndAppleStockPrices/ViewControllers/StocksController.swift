//
//  StocksController.swift
//  PeopleAndAppleStockPrices
//
//  Created by God on 9/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "stocksCell", for: indexPath)
//        let stocks: Stocks
//        stocks = stockData[indexPath.row]
    cell.textLabel?.text = "\(stockData[indexPath.row].date)"
    cell.detailTextLabel?.text = "\(stockData[indexPath.row].changePercent)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail2" {
            print("Segue works")
            if let indexPath = stocksView.indexPathForSelectedRow {
                let stock: Stocks
                stock = stockData[indexPath.row]
                print("Data populating?")
                let controller = (segue.destination as! StocksDetailViewController)
                controller.detailStocks = stock
                print("Data displaying?")
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
//            self.performSegue(withIdentifier: "showDetail2", sender: nil)
        }

    }
    
    @IBOutlet weak var stocksView: UITableView!
    
    var stockData = [Stocks](){
        didSet {
            DispatchQueue.main.async
                {
                    self.stocksView.reloadData()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksView.dataSource = self
        stocksView.delegate = self
        fetchData()
       
        // Do any additional setup after loading the view.
    }
    
    
    func fetchData() {
        StockAPIClient.shared.getStocks { (result) in
            switch result {
            case .failure(let error):
                print("Error Code: \(error)")
            case .success(let stockss):
                self.stockData = stockss
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
