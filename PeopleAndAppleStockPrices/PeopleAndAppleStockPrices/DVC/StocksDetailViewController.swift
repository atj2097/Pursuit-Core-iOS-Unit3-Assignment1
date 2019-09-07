//
//  StocksDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by God on 9/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailViewController: UIViewController {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var stockPicture: UIImageView!
    @IBOutlet weak var close: UILabel!
    @IBOutlet weak var open: UILabel!
    
    
    var detailStocks: Stocks? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailStocks = detailStocks {
            if let date = date, let close = close, let open = open {
                open.text = "\(detailStocks.open)"
                date.text = detailStocks.date
               close.text = "\(detailStocks.close)"
                title = "\(detailStocks.changePercent)"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        if detailStocks!.changePercent < 0.0 {
            self.view.backgroundColor = UIColor.red
            stockPicture.image = UIImage(named: "thumbsDown")
            navigationController?.navigationBar.tintColor = UIColor.white
            navigationController?.navigationBar.barTintColor = UIColor.red
           
        }
        else {
            self.view.backgroundColor = UIColor.green
            stockPicture.image = UIImage(named: "thumbsUp")
            navigationController?.navigationBar.barTintColor = UIColor.green
            navigationController?.navigationBar.tintColor = UIColor.white
           
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        // Do Your Lines of Code ...
        navigationController?.navigationBar.barTintColor = UIColor.white
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
