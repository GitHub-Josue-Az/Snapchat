//
//  VerSnapViewController.swift
//  Snapchat
//
//  Created by JosueAlva on 12/06/19.
//  Copyright © 2019 Josue. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class VerSnapViewController: UIViewController {

    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Label.text? = snap.descrip
        ImageView.sd_setImage(with: URL(string: snap.imagenURL))
        
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
   FIRDatabase.database().reference().child("usuarios").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.id).removeValue()
        
        
    }
    
    

}




