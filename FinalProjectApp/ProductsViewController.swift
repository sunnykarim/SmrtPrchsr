//
//  ProductsViewController.swift
//  FinalProjectApp
//
//  Created by Sunny Karim on 1/6/21.
//

import UIKit

protocol ViewControllerDelegate: class {
    func updateProducts(p: Product)
}

class ProductsViewController: UIViewController, UITableViewDelegate,
                              UITableViewDataSource {
    

    var products: [Product] = [Product(productType: "Groceries", productName: "Apples (5 lb)", productPrice: 3.99, retailer: "Whole Foods Market", datePurchased: "01/07/2021", numDaysRtrn: "30 days"),Product(productType: "Clothes", productName: "T-Shirt", productPrice: 39.99, retailer: "Nordstrom", datePurchased: "01/07/2021", numDaysRtrn: "No set date"), Product(productType: "Subscription", productName: "Netflix 4K UHD Plan", productPrice: 18.99, retailer: "Netflix", datePurchased: "01/07/2021", numDaysRtrn: "N/A")]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addItem: UIButton!
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Purchases"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of rows is equal to number of names
        return products.count
    }
    
    // The height of the rows should be 120 points
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // 2
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get row
        let aRow = indexPath.row
        
        // variables
        let type = products[aRow].productType
        let name = products[aRow].productName
        let price = products[aRow].productPrice
        let r = products[aRow].retailer
        let purch = products[aRow].datePurchased
        let rp = products[aRow].numDaysRtrn
        
        // get instance of cell
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductCell
            
        // modify properties of cell
        tableViewCell.tName!.text = name
        tableViewCell.tType!.text = type
        tableViewCell.tPrice!.text = "$" + String(price)
        tableViewCell.tReturn!.text = rp
        tableViewCell.rtlr!.text = r
        tableViewCell.purchDate!.text = purch
            
        // Update grand total price
        var tot: Double = 0.0
        for p in products {
            tot = tot + p.productPrice
        }
        total.text = "$" + String(tot)
        
        // return
        return tableViewCell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check if going to 3rd vc
        if let vc = segue.destination as? AddProductViewController {
            vc.delegate = self
        }
        else {
            // do nothing
        }
    }
    
  @IBAction func myUnwindAction(segue: UIStoryboardSegue)
   {
        
    }
}

extension ProductsViewController: ViewControllerDelegate {
    
    func updateProducts(p: Product) {
        products.append(p)
        tableView.reloadData()
    }
    
}

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var tType: UILabel!
    @IBOutlet weak var tPrice: UILabel!
    @IBOutlet weak var tName: UILabel!    
    @IBOutlet weak var rtlr: UILabel!
    @IBOutlet weak var purchDate: UILabel!
    @IBOutlet weak var tReturn: UILabel!
    
}
