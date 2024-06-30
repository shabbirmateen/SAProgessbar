//
//  SAProgressbar.swift
//  SAProgressBar
//
//  Created by Shabbir Ahmad on 29/06/24.
//

import UIKit

protocol ProgressbarDelegate : NSObject {
    func progressbarCallback(index:Int)
}

class SAProgressbar: UIView {
    // MARK: - Public Properties -
    @IBInspectable public var barColor: UIColor = .lightGray
    @IBInspectable public var trackColor: UIColor = .white
    @IBInspectable public var barAlpha: CGFloat = 0.7
    public var didBarChanged: ((Int)->())?
    public var willBarChanged: ((Int)->())?
    public var timeCount: Float = 5.0
    @IBInspectable public var noOfBar: Int = 2 {
        didSet {
            self.drawUI()
        }
    }
    
    // MARK: - Private Properties -
    private weak var delegate: ProgressbarDelegate?
    private var time : Float = 0.0
    private var timer: Timer?
    private var progressbarList = [UIProgressView]()
    private var barCount: Int = 0
    
    // MARK: - Init methods -
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.drawUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        //self.drawUI()
    }
    
    // MARK: - Private methods -
    fileprivate func drawUI() {
        self.delegate = self
        barCount = 0
        self.backgroundColor = .clear
        
        for barTag in 0..<noOfBar {
            
            let singleProgressbar = UIProgressView(progressViewStyle: .default)
            singleProgressbar.alpha = barAlpha
            singleProgressbar.progressTintColor = trackColor
            singleProgressbar.trackTintColor = barColor
            singleProgressbar.tag = barTag
            singleProgressbar.frame = CGRect(x: barTag * Int(self.frame.width) / noOfBar, y: 0, width: Int(self.frame.width) / noOfBar - 3, height: 2)
            self.addSubview(singleProgressbar)
            progressbarList.append(singleProgressbar)
        }
    }
    
    private func initiateLoading() {
        if barCount == noOfBar {
            barCount = 0
        }
        willBarChanged?(barCount)
        time = 0.0
        progressbarList[barCount].progress = 0
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector:#selector(setProgress), userInfo: nil, repeats: true)
    }
    
    @objc func setProgress() {
        if barCount < noOfBar {
            time += 0.001
            progressbarList[barCount].setProgress(time/timeCount, animated: true)
            if time >= timeCount {
                timer!.invalidate()
                self.didBarChanged?(barCount)
                if barCount < noOfBar {
                    barCount += 1
                    delegate?.progressbarCallback(index: barCount)
                }
            }
        }
    }
    
    // MARK: - Public methods -
    public func startLoading(page: Int) {
        for i in 0..<page {
            progressbarList[i].progress = 1.0
        }
        
        for j in page..<noOfBar {
            progressbarList[j].progress = 0.0
        }
        barCount = page
        if timer != nil {
            timer!.invalidate()
        }
        initiateLoading()
    }
}

extension SAProgressbar: ProgressbarDelegate {
    func progressbarCallback(index: Int) {
        if index < noOfBar {
            self.initiateLoading()
            
        }
    }
    
}

