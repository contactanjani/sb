//
//  HomeController.swift
//  sb
//
//  Created by Anjani on 11/12/16.
//  Copyright © 2016 do. All rights reserved.
//

import Foundation
import UIKit

/*
 This is the 'View', It simply adds a View and asks the view to populate itself. Also, it handles the product tap and goes to next page
 */

class HomeController : UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addProductTable()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gotoDetailPage(product : Product){
        
        self.performSegue(withIdentifier: "detail", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"
        {
            let vc = segue.destination as? ProductDetailViewController
            vc?.product = sender as? Product
        }
    }
    
}

extension HomeController : ProductTableViewDelegate
{
    func didTapProduct(product : Product){
        
        gotoDetailPage(product: product)
    }
    
    func addProductTable(){
        
        let productView = ProductTableView.loadView()
        productView.delegate = self
        self.view.addSubview(productView)
        productView.populate { (value) in    //populate call
            
            if value == false
            {
                print("error")
            }
            else{
                print("success")
                DispatchQueue.main.async(execute: { () -> Void in
                    productView.refreshTable()
                })
            }
        }
    }
}

