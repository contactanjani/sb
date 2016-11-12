//
//  ProductTableViewCell.swift
//  sb
//
//  Created by Anjani on 11/11/16.
//  Copyright © 2016 do. All rights reserved.
//

import Foundation
import UIKit

/*
 This is tableView cell to display product data in first page
 */

class ProductTableViewCell : UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblPrice: UILabel?
    @IBOutlet weak var lblDescription: UILabel?
    @IBOutlet weak var imgProduct: UIImageView!
    
    
    func populate(product : Product){
        
        DispatchQueue.main.async {
            weak var weakSelf = self
            weakSelf?.clearCell()
            weakSelf?.populateWithData(product: product)
        }
    }
    
    private func clearCell(){
        
        lblTitle?.text = nil
        lblPrice?.text = nil
        lblDescription?.text = nil
        imgProduct.image = nil
    }
    
    private func populateWithData(product : Product){
        
        lblTitle?.text = product.title
        lblPrice?.text = product.displayPrice
        lblDescription?.text = product.description
        self.populateImage(product: product)
    }
    
    private func populateImage(product: Product){
        
        let url = URL(string: product.imgUrl!)
        DispatchQueue.global().async {
            do
            {
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data)
                DispatchQueue.main.async {   //caching logic to be implemented //sdwebimage doesn't support swift3 without glitches
                    self.imgProduct.image = image
                }
            }catch
            {
                    print("error downloading image")
            }
        }
    }
}
