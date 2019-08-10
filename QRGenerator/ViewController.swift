//
//  ViewController.swift
//  QRGenerator
//
//  Created by Ramcharan Reddy Gaddam on 10/08/19.
//  Copyright © 2019 Ramcharan Reddy Gaddam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yourQRCodeLabel: UILabel!
    
    @IBOutlet weak var qrcodeImageView: UIImageView!
    
    var qrImage:CIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.yourQRCodeLabel.isHidden = true
        self.qrcodeImageView.isHidden = true
        textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" { return false }
        let data = textField.text?.data(using: .isoLatin1, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("M", forKey: "inputCorrectionLevel")
        qrImage = filter?.outputImage
        qrcodeImageView.image = UIImage(ciImage: qrImage!)
        self.yourQRCodeLabel.isHidden = false
        self.qrcodeImageView.isHidden = false
        textField.resignFirstResponder()
        return true
    }
}

