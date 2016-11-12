//
//  ProductDetailViewController.swift
//  sb
//
//  Created by Anjani on 11/12/16.
//  Copyright © 2016 do. All rights reserved.
//

import Foundation
import UIKit

/*
 this class shows the product detail once it is tapped in the first page
 */

class ProductDetailViewController : UIViewController
{
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var product : Product?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        populate()
    }
}

extension ProductDetailViewController
{
    func populate()
    {
        lblTitle.text = product?.title
        lblPrice.text = product?.displayPrice
        lblDescription.text = product?.description
    }
}
