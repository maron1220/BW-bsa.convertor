//
//  ViewController.swift
//  BW-convertor
//
//  Created by 細川聖矢 on 2019/08/29.
//  Copyright © 2019 Seiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
        case 0:
            return animalList.count
        case 1:
            return bodyWeightList.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
        case 0:
            return animalList[row]
        case 1:
            return bodyWeightList[row]
        default:
            return "error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            animalLabel.text = animalList[row]
        case 1:
            bodyWeightLabel.text = bodyWeightList[row]
        default:
            break
        }
    }
    
    func convert(){
        var weight = bodyWeightLabel.text!
        var index = bodyWeightList.firstIndex(of:"\(weight)")!
        switch animalLabel.text {
        case animalList[0]:
            resultLabel.text = canineBsaList[index]
        case animalList[1]:
            //猫の配列に値が無い時の場合分け
            if index >= felineBsaList.count{
                resultLabel.text = "＼(^o^)／"
            }else{
                resultLabel.text = felineBsaList[index]
            }
        default:
            resultLabel.text = "error"
        }
    }
    
    var animalList = ["犬","猫"]
    var bodyWeightList = ["1","2","3","4","5","6","7","8","9","10"]
    var canineBsaList = ["0.101","0.160","0.210","0.262","0.295","0.334","0.370","0.404","0.437","0.469"]
    var felineBsaList = ["0.100","0.159","0.208","0.293","0.330","0.366","0.366","0.400"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView.selectRow(0, inComponent: 1, animated: false)
        
        animalLabel.text = animalList[0]
        bodyWeightLabel.text = bodyWeightList[0]
        
        resultLabel.layer.borderWidth = 1.0
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func caliculateButton(_ sender: Any) {
        convert()
    }
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var bodyWeightLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var buttonView: UIButton!
    
}

