//
//  OpleidingVC.swift
//  CRM
//
//  Created by Roy Berner on 05/01/2018.
//  Copyright © 2018 Roy Berner. All rights reserved.
//

import UIKit

class OpleidingVC: UIViewController {
    
    
    @IBOutlet weak var opleidingLbl: UILabel!
    @IBOutlet weak var zoeknaamLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var prijsLabel: UILabel!
    @IBOutlet weak var beginLabel: UILabel!
    @IBOutlet weak var eindLabel: UILabel!
    
    
    
    
    var opleiding:Opleiding?

    override func viewDidLoad() {
        super.viewDidLoad()

        opleidingLbl.text = opleiding?.naam_opleiding
        zoeknaamLbl.text = opleiding?.zoeknaam_opleiding
        idLbl.text = opleiding?.opleiding_id
        prijsLabel.text = opleiding?.prijs
        beginLabel.text = opleiding?.begin_datum
        eindLabel.text = opleiding?.eind_datum
        
        
        let myVC = self.tabBarController?.viewControllers![1] as! OpleidingEditVC
        myVC.opleidingNaam = opleidingLbl.text!
        myVC.zoeknaam = zoeknaamLbl.text!
        myVC.opleidingID = idLbl.text!
        myVC.opleidingPrijs = prijsLabel.text!
        myVC.opleidingBegin = beginLabel.text!
        myVC.opleidingEind = eindLabel.text!
        

    }



}
