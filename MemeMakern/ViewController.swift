//
//  ViewController.swift
//  MemeMakern
//
//  Created by Ali Oguz on 2.10.2024.
//

import UIKit

class ViewController: UIViewController {

    
    
    //mark İB Outlets
    
    
    
    @IBOutlet weak var topsegmentedcontrol: UISegmentedControl!
        
    
    
    @IBOutlet weak var bottomsegmentedcontrol: UISegmentedControl!
    
    
    
    @IBOutlet weak var topcaptionlabel: UILabel!
    
    
    
    @IBOutlet weak var bottomcaptionlabel: UILabel!
    
   //mark instance properties
    let topChoices = [
        CaptionOption(emoji: "🕶️", caption: "You know whats cool?"),
        CaptionOption(emoji: "💥", caption: "You know what makes me mad?"),
        CaptionOption(emoji: "💕", caption: "You know what I love"),
]
    
    let bottomChoices = [
        CaptionOption(emoji: "🐒", caption: "monkeys wearıng hats"),
        CaptionOption(emoji: "😸", caption: "Funky cats"),
        CaptionOption(emoji: "🦮", caption: "dogs carrying logs"),
]
    
    //mark Vdl
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        topsegmentedcontrol.removeAllSegments()
        for choice in topChoices {
            topsegmentedcontrol.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topsegmentedcontrol.selectedSegmentIndex = 0
        
        bottomsegmentedcontrol.removeAllSegments()
        for choices in bottomChoices {
            bottomsegmentedcontrol.insertSegment(withTitle: choices.emoji, at: bottomChoices.count, animated: false)
        }
        bottomsegmentedcontrol.selectedSegmentIndex = 0
        
        updateCaptions()
    }
// İb Actions
    
    @IBAction func segmentedcontrolchanged(_ sender: Any){
        updateCaptions()
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topcaptionlabel.center = sender.location(in: view)
             
        }
    }
    
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomcaptionlabel.center = sender.location(in: view)
             
        }
    }
    
    
//instantmethods
    func updateCaptions() {
        let topIndex = topsegmentedcontrol.selectedSegmentIndex
        topcaptionlabel.text = topChoices[topIndex].caption
        
        let bottomIndex = bottomsegmentedcontrol.selectedSegmentIndex
        bottomcaptionlabel.text = bottomChoices[bottomIndex].caption
    }

}

