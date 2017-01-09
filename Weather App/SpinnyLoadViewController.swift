//
//  SpinnyLoadViewController.swift
//  Weather App
//
//  Created by Phammel on 11/7/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit

class SpinnyLoadViewController: UIViewController
{
    @IBOutlet weak var loadyMcLoadface: UIActivityIndicatorView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadyMcLoadface.startAnimating()
    }

}
