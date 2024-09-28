import UIKit
import AVFoundation
import AudioToolbox

class ViewController2: UIViewController {
    
    @IBOutlet weak var softboiledBt: UIButton!
    
    @IBOutlet weak var inapounchBt: UIButton!
    
    @IBOutlet weak var hardboiledBt: UIButton!
    
    let softboiledConst = 240
    let inapounchConst = 360
    let hardboiledConst = 450
    /*let timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)*/
    
    var selectedType = Array(repeating: false, count: 3)
    var timery = Timer()
    var isStarted = false
    var counter: Int?
    
    @IBAction func softboiledAction(_ sender: Any) {
        if !isStarted {
            selectedType[2] = false
            selectedType[1] = false
            selectedType[0] = true
            setHighLightingForButtons()
            refreshTimer()
        }
    }
    
    @IBAction func inapounchAction(_ sender: Any) {
        if !isStarted{
            selectedType[2] = false
            selectedType[1] = true
            selectedType[0] = false
            setHighLightingForButtons()
            refreshTimer()
            
        }
    }
    
    @IBAction func hardboiledAction(_ sender: Any) {
        if !isStarted {
            selectedType[2] = true
            selectedType[1] = false
            selectedType[0] = false
            setHighLightingForButtons()
            refreshTimer()
        }
    }
    
    @IBOutlet weak var startbuttonoutlet: UIButton!
    
    
    
    @IBAction func startbuttonAction(_ sender: Any) {
        if !isStarted {
            counter = getCurrentTimer()
            timery.invalidate()
            timery = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.timerAction), userInfo: nil, repeats: true)
            startbuttonoutlet.setImage(#imageLiteral(resourceName: "stop"), for: UIControlState())
            isStarted = true
            disableButton ()
            
        }else{
            isStarted = false
            timery.invalidate()
            refreshTimer()
            enableButton()
            setHighLightingForButtons()
            startbuttonoutlet.setImage(#imageLiteral(resourceName: "play-button"), for: UIControlState())
        }
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @objc func timerAction() {
        counter! -= 1
        if counter! < 0 {
            timerLabel.text = "Ready"
            AudioServicesPlaySystemSound(SystemSoundID(1073))
            AudioServicesPlaySystemSound(SystemSoundID(4095))
        }else {
            timerLabel.text = NSString (format: "%0.2d:%0.2d",counter!/60,counter!%60) as String
        }
    }
    
    func refreshTimer() {
        counter = getCurrentTimer()
        timerLabel.text = NSString (format: "%0.2d:%0.2d",counter!/60,counter!%60) as String
        
    }
    
    func disableButton () {
        softboiledBt.isEnabled = false
        inapounchBt.isEnabled = false
        hardboiledBt.isEnabled = false
        
    }
    func enableButton () {
        softboiledBt.isEnabled = true
        inapounchBt.isEnabled = true
        hardboiledBt.isEnabled = true
        
    }
    /* func timerFunc(timer: Timer) {
     var backgroundTask = UIApplication.shared.beginBackgroundTask {
     //доделать
     }
     
     }
     if backgroundTask != UIBackgroundTaskInvalid {
     if UIApplication.shared.applicationState == .active {
     UIApplication.shared.endBackgroundTask(backgroundTask)
     backgroundTask = UIBackgroundTaskInvalid
     }
     }
     }*/
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        softboiledBt.isHighlighted = true
        inapounchBt.isHighlighted = true
        selectedType[2] = true
        timerLabel.text = NSString(format: "%0.2d:%0.2d",hardboiledConst/60,hardboiledConst%60) as String
    }
    
    func getCurrentTimer() -> Int {
        if selectedType [0] {
            return softboiledConst
        }
        else if selectedType [1] {
            return inapounchConst
        } else{
            return hardboiledConst
        }
    }
    
    func setHighLightingForButtons() {
        if selectedType[0]{
            softboiledBt.isHighlighted = false
            inapounchBt.isHighlighted = true
            hardboiledBt.isHighlighted = true
            
        }else if selectedType[1]{
            softboiledBt.isHighlighted = true
            inapounchBt.isHighlighted = false
            hardboiledBt.isHighlighted = true
            
        }else if selectedType[2]{
            softboiledBt.isHighlighted = true
            inapounchBt.isHighlighted = true
            hardboiledBt.isHighlighted = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
