//
//  ViewController.swift
//  BackgroundColor
//
//  Copyright (c) 2015 Koby Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var hueSlider: UISlider!
    
    let kOnOffToggle="onOff"
    let kHueSetting="hue"
    
    @IBAction func setBackgroundHueValue(sender: AnyObject?) {
        
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setBool(toggleSwitch.on, forKey: kOnOffToggle)
        userDefaults.setFloat(hueSlider.value, forKey: kHueSetting)
        userDefaults.synchronize()
        
        if toggleSwitch.on {
            view.backgroundColor=UIColor(hue: CGFloat(hueSlider.value),
                saturation: 0.75, brightness: 0.75, alpha: 1.0)
        } else {
            view.backgroundColor=UIColor.whiteColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        hueSlider.value=userDefaults.floatForKey(kHueSetting)
        toggleSwitch.on=userDefaults.boolForKey(kOnOffToggle)
        
        setBackgroundHueValue(nil)
        /*
        if toggleSwitch.on {
            view.backgroundColor=UIColor(hue: CGFloat(hueSlider.value),
                saturation: 0.75, brightness: 0.75, alpha: 1.0)
        } else {
            view.backgroundColor=UIColor.whiteColor()
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

