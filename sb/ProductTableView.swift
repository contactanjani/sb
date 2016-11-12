//
//  ProductTableView.swift
//  sb
//
//  Created by Anjani on 11/11/16.
//  Copyright © 2016 do. All rights reserved.
//

import Foundation
import UIKit

/*
 This class creates the tableview and populates data by calling MainController
 */

protocol ProductTableViewDelegate : class
{
    func didTapProduct(product : Product)
}

class ProductTableView : UIView, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tblProduct: UITableView!
    weak var delegate : ProductTableViewDelegate?
    var productList : [Product]?
    
    class func loadView() -> ProductTableView {
        
        let view = UINib(nibName: "ProductTableView", bundle: Bundle.main).instantiate(withOwner: nil, options: nil)[0] as? ProductTableView
        view?.tblProduct.register(UINib(nibName: "ProductTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "product")
        return view!
    }
    
    func populate(completionHandler: @escaping (Bool?) -> Swift.Void){
        
        MainController.sharedInstance.getProductData {[weak self] (list) in
            self?.productList = list
            if list != nil
            {
                self?.refreshTable()
                completionHandler(true)
            }else
            {
                completionHandler(false)
            }
        }
    }
    
    func refreshTable()
    {
        DispatchQueue.main.async {
            self.tblProduct.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard delegate != nil else {
            return
        }
        delegate?.didTapProduct(product: (productList?[indexPath.row])!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard productList != nil else {
            return 0
        }
        return productList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "product") as? ProductTableViewCell
        guard cell != nil else {
            cell = ProductTableViewCell()
            cell?.contentView.backgroundColor = UIColor.green
            return cell!
        }
        cell?.populate(product: (productList?[indexPath.row])!)
        return cell!
    }
}
