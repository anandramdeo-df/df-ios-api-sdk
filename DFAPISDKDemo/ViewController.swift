//
//  ViewController.swift
//  DFAPISDKDemo
//
//  Created by Ankit Jayaswal on 17/10/18.
//  Copyright © 2018 Ranosys. All rights reserved.
//

import UIKit
import DFAPIFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUser()
    }
    
    @IBAction func getOCRForVietnameseID(_ sender: UIButton) {
        sender.titleLabel?.numberOfLines = 2
        getOcrResultFromImages()
    }
    
    func convertIntoData(image: UIImage) -> Data? {
        return image.jpegData(compressionQuality: 1.0)
    }

}

extension ViewController {
  
    func authenticateUser() {
        let countryCode: String = "<Country-Code>"
        let phoneNumber: String = "<Phone-Number>"
        ConnectionManager.instance.authenticateUser(countryCode: countryCode, phoneNumber: phoneNumber, success: { (success) in
            print(success ?? "" )
        }, failure: { (error) in
            print(error ?? "" )
        })
    }

    func getOcrResultFromImages() {
        guard let imagef = UIImage(named: "Vietnese-ID") else { return }
       
        var mediaArray = [MultipartDataModal]()
        if let imageData = convertIntoData(image: imagef) {
            mediaArray.append(MultipartDataModal.init(type: .image, fileName: "front_image", data: imageData))
        }
        if let img = UIImage(named: ""), let imageData = convertIntoData(image: img) {
            mediaArray.append(MultipartDataModal.init(type: .image, fileName: "back_image", data: imageData))
        }
        
        ConnectionManager.instance.getOCRResultFromImage(multipartDataArray: mediaArray, assetSubTypeName: "Identity Card", success: { success in
            print(success ?? "" )
        }, failure: { error in
            print(error ?? "" )
        })
    }

    func checkUserSelfie() {
        let imageb = UIImage(named: "selfie")
        var mediaArray = [MultipartDataModal]()
        if let imageData = convertIntoData(image: imageb!) {
            mediaArray.append(MultipartDataModal.init(type: .image, fileName: "document", data: imageData))
        }
        ConnectionManager.instance.checkUserSelfie(multipartDataArray: mediaArray, success: { (success) in
            print(success ?? "")
        }, failure: { error in
            print(error ?? "")
        })
    }

    func geoAddressCheck() {
        ConnectionManager.instance.geoAddressCheck(success: { (success) in
            print(success ?? "")
        },failure: { (error) in
            print(error ?? "")
        })
    }
    
    func logoutUser() {
        ConnectionManager.instance.doLogout(success: { (success) in
            print(success ?? "")
        }, failure: { (error) in
            print(error ?? "")
        })
    }

}
