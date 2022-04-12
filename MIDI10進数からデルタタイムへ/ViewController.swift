//
//  ViewController.swift
//  MIDI10進数から16進数へ
//
//  Created by ZhuZhuKitty on 2019/01/21.
//  Copyright © 2019 Zhu Zhu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITextFieldDelegate {

    let textField = UITextField()
    let kahenLabel = UILabel()
    let hexaLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(white: 0.6, alpha: 1.0)
        
        let Questionlabel = UILabel()
        Questionlabel.text = "十進数の数字を入力"
        //必须先写大小再定中心点位置，否则位置会乱套
        Questionlabel.frame.size.width = self.view.bounds.size.width * 2 / 3
        Questionlabel.frame.size.height = 48
        Questionlabel.center.x = self.view.bounds.size.width * 1 / 2 //self.view.center.x
        Questionlabel.center.y = self.view.bounds.size.height*1.6/10
        
       // Questionlabel.backgroundColor = UIColor(red: 164/255 , green: 157/255, blue: 19/255, alpha: 0.5)
        Questionlabel.textColor = UIColor.black
        Questionlabel.textAlignment = .left
        self.view.addSubview(Questionlabel)
        //---------------input textfield---------------
        
        textField.keyboardType = UIKeyboardType.default
        
        textField.frame.size.width = self.view.frame.width * 2 / 3
        textField.frame.size.height = 48
        
        textField.center.x = self.view.center.x
        textField.center.y = self.view.bounds.size.height*1.6/10+48
        
        textField.delegate = self
        
        textField.placeholder = "十進数を入力"
        
        textField.backgroundColor = UIColor.white//UIColor(white: 0.6, alpha: 1)
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        textField.clearButtonMode = .always
        
        textField.returnKeyType = .done
        textField.textColor = UIColor.black
        textField.textAlignment = .center
      
        self.view.addSubview(textField)
        
        //-----------------------button-------
        
        let MKJbutton = UIButton(type: UIButton.ButtonType.custom)
        MKJbutton.backgroundColor = UIColor(red: 255/255 , green: 255/255, blue: 0/255, alpha: 0.5)
        MKJbutton.frame.size.width = self.view.bounds.size.width * 2/3
        MKJbutton.frame.size.height = 48
        MKJbutton.center.x = self.view.center.x
        MKJbutton.center.y = self.view.bounds.size.height*4/10
        
        MKJbutton.showsTouchWhenHighlighted = true
        MKJbutton.setTitle("MIDI デルタタイム計算機", for: UIControl.State.normal)
        MKJbutton.titleLabel?.textAlignment = .center
        MKJbutton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        MKJbutton.setTitleShadowColor(UIColor.white, for: UIControl.State.normal)
        MKJbutton.titleLabel?.shadowOffset = CGSize(width:1,height:-1)
        MKJbutton.isExclusiveTouch = true//为了预防这个几个button 被同时按下，这个是保持唯一性的。每次只能按下一个button。
        MKJbutton.addTarget(self, action: #selector(onClick(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(MKJbutton)
        
        
        //------------------------------------------------------
        let showLabel1 = UILabel()
        showLabel1.text = "Delta Timeの十六進数"
        //必须先写大小再定中心点位置，否则位置会乱套
        showLabel1.frame.size.width = self.view.bounds.size.width * 2 / 3
        showLabel1.frame.size.height = 48
        showLabel1.center.x = self.view.center.x
        showLabel1.center.y = self.view.bounds.size.height*6/10-48
        
        showLabel1.textColor = UIColor.black
        showLabel1.textAlignment = .left
        self.view.addSubview(showLabel1)
        
       
        kahenLabel.text = " "
        //必须先写大小再定中心点位置，否则位置会乱套
        kahenLabel.frame.size.width = self.view.bounds.size.width * 2 / 3
        kahenLabel.frame.size.height = 48
        kahenLabel.center.x = self.view.center.x
        kahenLabel.center.y = self.view.bounds.size.height*6/10
        
        kahenLabel.backgroundColor = UIColor(red: 64/255 , green: 157/255, blue: 119/255, alpha: 1.0)
        kahenLabel.textColor = UIColor.black
        kahenLabel.textAlignment = .left
        self.view.addSubview(kahenLabel)
        
        let showLabel2 = UILabel()
        showLabel2.text = "普通の十六進数（参考用）"
        //必须先写大小再定中心点位置，否则位置会乱套
        showLabel2.frame.size.width = self.view.bounds.size.width * 2 / 3
        showLabel2.frame.size.height = 48
        showLabel2.center.x = self.view.center.x
        showLabel2.center.y = self.view.bounds.size.height*7.5/10-30
        
        showLabel2.textColor = UIColor.black
        showLabel2.textAlignment = .left
        self.view.addSubview(showLabel2)
        
        
        hexaLabel.text = " "
        //必须先写大小再定中心点位置，否则位置会乱套
        hexaLabel.frame.size.width = self.view.bounds.size.width * 2 / 3
        hexaLabel.frame.size.height = 48
        hexaLabel.center.x = self.view.center.x
        hexaLabel.center.y = self.view.bounds.size.height*7.8/10
        
        hexaLabel.backgroundColor = UIColor(red: 164/255 , green: 57/255, blue: 19/255, alpha: 1.0)
        hexaLabel.textColor = UIColor.black
        hexaLabel.textAlignment = .left
        self.view.addSubview(hexaLabel)
        
        
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        textField.resignFirstResponder()
        return true
    }
    
    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        kahenLabel.text = ""
        hexaLabel.text = ""
       
        
        return true
        
    }
    
    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if (textField.text == " "||textField.text == ""){
            kahenLabel.text = ""
            hexaLabel.text = ""
        }
       
        return true
    }
    
    // テキストフィールドでの編集が終わろうとするときの処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       
        if (textField.text == " "||textField.text == ""){
            kahenLabel.text = ""
            hexaLabel.text = ""
        }
        return true
    }
    func StringToInt(str:String)->(Int){
        
        let string = str
        var cgInt: Int = 0
        
        if let doubleValue = Double(string)
        {
            cgInt = Int(doubleValue)
        }
        return cgInt
    }
    
    @objc func onClick(sender : UIButton){
        let numberTextField = StringToInt(str: textField.text!)
        
        kahenLabel.text = self.decimal_deltaTimeHex(number: numberTextField)
        hexaLabel.text =  self.decimal_Hex(num: numberTextField)
        print("delta time 16進数(可変長数)：\(kahenLabel.text!)")
        print("普通の十六進数：\(hexaLabel.text!)")
        
       
    }
    
   
    //----十進数からデルタタイムの16進数（可変長数）へ変換　三つの関数---------
    func decimal_deltaTimeHex(number:Int)->String{
        let num = number
        
        var Str = " "
        
        if(num >= 128*128*128*128){
            Str = "delta-timeは4Byteを超えたらダメ"
            
        }
        else if(num >= 0 && num <= 127){
            //just one byte,directly to hex
            let a =  NSString(format: "%02X",num) as String
            
            Str = "00 " + a
            
        }
        else if(num>127&&num<=128*127+127){
            
            let zhenshu:Float = Float(num)/128.0
            
            let shang = Int(floor(zhenshu))
            let yu = num % 128
            
            let aTo_Decimal = firstBit_ReplaceOne(num: shang)
            let aTo_Hex = NSString(format: "%02X", aTo_Decimal) as String
            
            let bTo_Hex = NSString(format: "%02X", yu) as String
            
            let kk = aTo_Hex+" "+bTo_Hex
            Str = kk
            
            
        }
        else if(num>128*127+127&&num<=128*128*127+128*127+127){
            let zhenshu:Float = Float(num)/(128.0*128.0)
            let shang1 = Int(floor(zhenshu))
            let yuF = num % (128*128)
            let shang2 = Int(floor(Float(yuF)/128.0))
            let c = yuF % 128
            
            let aTo_Decimal = firstBit_ReplaceOne(num: shang1)
            let aTo_Hex = NSString(format: "%02X", aTo_Decimal) as String
            
            let bTo_Decimal = firstBit_ReplaceOne(num: shang2)
            let bTo_Hex = NSString(format: "%02X", bTo_Decimal) as String
            
            let cTo_Hex = NSString(format: "%02X", c) as String
            
            let kk = aTo_Hex+" "+bTo_Hex+" "+cTo_Hex
            Str = kk
            
        }
        else if(num>128*128*127+128*127+127&&num<=128*128*128*127+128*128*127+128*127+127){
            let zhenshu:Float = Float(num)/(128.0*128.0*128.0)
            let shang1 = Int(floor(zhenshu))//求商，去掉所有小数位
            let yuF = num % (128*128*128)
            
            let shang2 = Int(floor(Float(yuF)/(128.0*128)))
            let yuG = yuF % (128*128)
            
            let shang3 = Int(floor(Float(yuG)/128.0))
            let d = yuG % (128)
            
            let aTo_Decimal = firstBit_ReplaceOne(num: shang1)
            let aTo_Hex = NSString(format: "%02X", aTo_Decimal) as String
            
            let bTo_Decimal = firstBit_ReplaceOne(num: shang2)
            let bTo_Hex = NSString(format: "%02X", bTo_Decimal) as String
            
            let cTo_Decimal = firstBit_ReplaceOne(num: shang3)
            let cTo_Hex = NSString(format: "%02X", cTo_Decimal) as String
            
            let dTo_Hex = NSString(format: "%02X", d) as String
            
            let kk = aTo_Hex+" "+bTo_Hex+" "+cTo_Hex+" "+dTo_Hex
            Str = kk
            
            
        }
        else{
            Str = "数字範囲の対象外です。"
        }
        
        return Str
    }
    func decimalTobinary(number:Int,toSize:Int) -> String {
        
        let str = String(number, radix: 2)
        
        var padded = str
        for _ in 0..<(toSize - str.count) {
            padded = "0" + padded
        }
        
        
        return padded
        
    }
    func firstBit_ReplaceOne(num:Int)->Int{
        var a = self.decimalTobinary(number:num,toSize: 8)
        
        a.remove(at: a.startIndex)
        let a_addOne = "1"+a
        
        let aTo_ten = Int(a_addOne, radix: 2)
        
        return aTo_ten!
    }
//---------------------------------------------------------------------------------------------------------
    //--------------------Function 十進数から普通の十六進数へ変換の関数 ---------------------------------------
    func decimal_Hex(num:Int)->String{
        var hexStr = " "
        if(num >= 128*128*128*128){
            
            hexStr = "delta-timeは4Byteを超えたらダメ"
        }
        else if(num >= 0 && num <= 127){
            //just one byte,directly to hex
            let a =  NSString(format: "%02X",num) as String
            
            hexStr = "00 " + a
        }
        else if(num>127&&num<=128*127+127){
            
            var hh = NSString(format: "%04X", num)as String
            let indexS = hh.index(hh.startIndex, offsetBy: 2)
            hh.insert(Character.init(" "), at: indexS)
            
            hexStr = hh
            
        }
        else if(num>128*127+127&&num<=128*128*127+128*127+127){
            
            var hh = NSString(format: "%06X", num)as String
            let indexS = hh.index(hh.startIndex, offsetBy: 2)
            let indexT = hh.index(hh.startIndex, offsetBy: 5)
            hh.insert(Character.init(" "), at: indexS)
            hh.insert(Character.init(" "), at: indexT)
            hexStr = hh
        }
        else if(num>128*128*127+128*127+127&&num<=128*128*128*127+128*128*127+128*127+127){
            
            var hh = NSString(format: "%08X", num)as String
            let indexS = hh.index(hh.startIndex, offsetBy: 2)
            let indexT = hh.index(hh.startIndex, offsetBy: 5)
            let indexR = hh.index(hh.startIndex, offsetBy: 8)
            hh.insert(Character.init(" "), at: indexS)
            hh.insert(Character.init(" "), at: indexT)
            hh.insert(Character.init(" "), at: indexR)
            hexStr = hh
        }
        
        return hexStr
    }
}

