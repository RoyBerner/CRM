//
//  OpleidingEditVC.swift
//  CRM
//
//  Created by Roy Berner on 23/11/2018.
//  Copyright © 2018 Roy Berner. All rights reserved.
//

import UIKit

class OpleidingEditVC: UIViewController {
    
    
    @IBOutlet weak var opleidingEditLbl: UITextField!
    @IBOutlet weak var zoeknaamOpleidingEditLbl: UITextField!
    @IBOutlet weak var opleidingIdEditLbl: UITextField!
    @IBOutlet weak var prijsEditLbl: UITextField!
    @IBOutlet weak var beginDaumEditLbl: UITextField!
    @IBOutlet weak var eindDatumEditLbl: UITextField!
    
    
    var opleiding:Opleiding?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        opleidingIdEditLbl.text = "test"
        
    }

}
