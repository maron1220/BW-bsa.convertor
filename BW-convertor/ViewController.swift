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
            resultLabel.text = "\(canineBsaList[index])"+"(m²)"
        case animalList[1]:
            //猫の配列に値が無い時の場合分け
            if index >= felineBsaList.count{
                resultLabel.text = "＼(^o^)／"
            }else{
                resultLabel.text = "\(felineBsaList[index])"+"(m²)"
            }
        default:
            resultLabel.text = "error"
        }
    }
    
    var animalList = ["犬","猫"]
    var bodyWeightList =
        ["1","1.1","1.2","1.3","1.4","1.5","1.6","1.7","1.8","1.9",
         "2","2.1","2.2","2.3","2.4","2.5","2.6","2.7","2.8","2.9",
         "3","3.1","3.2","3.3","3.4","3.5","3.6","3.7","3.8","3.9",
         "4","4.1","4.2","4.3","4.4","4.5","4.6","4.7","4.8","4.9",
         "5","5.1","5.2","5.3","5.4","5.5","5.6","5.7","5.8","5.9",
         "6","6.1","6.2","6.3","6.4","6.5","6.6","6.7","6.8","6.9",
         "7","7.1","7.2","7.3","7.4","7.5","7.6","7.7","7.8","7.9",
         "8","8.1","8.2","8.3","8.4","8.5","8.6","8.7","8.8","8.9",
         "9","9.1","9.2","9.3","9.4","9.5","9.6","9.7","9.8","9.9",
         "10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    var canineBsaList =
        ["0.101","0.108","0.114","0.120","0.126","0.132","0.138","0.144","0.149","0.155",
         "0.160","0.166","0.171","0.176","0.181","0.186","0.191","0.196","0.201","0.205",
         "0.210","0.221","0.226","0.231","0.235","0.240","0.244","0.249","0.253","0.258",
         "0.262","0.267","0.271","0.275","0.279","0.284","0.288","0.292","0.296","0.300",
         "0.295","0.299","0.303","0.307","0.311","0,315","0.319","0.322","0.326","0.330",
         "0.334","0.337","0.341","0.345","0.348","0.352","0.356","0.359","0.363","0.366",
         "0.370","0.373","0.377","0.380","0.384","0.387","0.391","0.394","0.398","0.401",
         "0.404","0.408","0.411","0.414","0.418","0.421","0.424","0.428","0.431","0.434",
         "0.437","0.441","0.444","0.447","0.450","0.453","0.457","0.460","0.463","0.466",
         "0.469","0.500","0.530","0.559","0.587","0.615","0.642","0.668","0.694","0.720","0.745","0.770","0.794","0.818","0.841","0.864","0.887","0.910","0.932","0.954","0.976"]
    var felineBsaList = ["0.100","0.107","0.113","0.119","0.125","0.131","0.137","0.142","0.148","0.153",
                         "0.159","0.164","0.169","0.174","0.179","0.184","0.189","0.194","0.199","0.203",
                         "0.208","0.213","0.217","0.222","0.226","0.231","0.235","0.239","0.244","0.248",
                         "0.252","0.256","0.260","0.265","0.269","0.273","0.277","0.281","0.285","0.289",
                         "0.293","0.296","0.300","0.304","0.308","0.312","0.316","0.319","0.323","0.327",
                         "0.330","0.334","0.338","0.341","0.345","0.349","0.352","0.356","0.359","0.363",
                         "0.366","0.370","0.373","0.377","0.380","0.383","0.387","0.390","0.394","0.397",
                         "0.400","0.404","0.407","0.410","0.414","0.417","0.420","0.423","0.427","0.430",
                         ]

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

