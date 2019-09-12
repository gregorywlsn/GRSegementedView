//   The MIT License (MIT)
//
//   Copyright © 2019 Gregory Wilson
//
//   Permission is hereby granted, free of charge, to any person obtaining a copy
//   of this software and associated documentation files (the "Software"), to deal
//   in the Software without restriction, including without limitation the rights
//   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//   copies of the Software, and to permit persons to whom the Software is
//   furnished to do so, subject to the following conditions:
//
//   The above copyright notice and this permission notice shall be included in all
//   copies or substantial portions of the Software.
//
//   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//   SOFTWARE.


import UIKit


public enum SegmentType {
    case round
    case square
    case roundMargin
    case squareMargin
}
@objc
public protocol GRSegmentedDelegate {
    func didSelected(_ segmentControl: GRSegmentedView, at index: Int)
}
@IBDesignable open class GRSegmentedView: UIView {
    // decide the font of the title. default font is system font with size 15
    open var titleFont: UIFont = .systemFont(ofSize: 15)
    private var segmentButtons = [UIButton]()
    private var selectedIndexReturn: Int = 0
    private var arrayReturn = [String]()
    private var selectorMargin = CGFloat(6)
    
    // decide the segment selector color. defalt color is brown
    @IBInspectable dynamic open var selectorColor: UIColor = .green
    
    // decide the title font color on selection. default color is brown
    @IBInspectable dynamic open var selectionTitleColor: UIColor = .white
    
    // decide the title font color on deselection. default color is black
    @IBInspectable dynamic open var deselectionTitleColor: UIColor = .black
    
    // decide the segment type. default type is round
    public var segmentType: SegmentType = .round
    
    // titles for the segments. No title means no title.
    open var segmentTitles: [String] {
        get {
            return arrayReturn
        }
        set (array) {
            arrayReturn = array
        }
    }
    
    /*
    Getter and setter variable.
    This can set the segment to an index and get the current selected index
    */
    @IBInspectable dynamic open var selecetdIndex: Int  {
        get {
            return selectedIndexReturn
        }
        set (selectedIndex){
            selectedIndexReturn = selectedIndex
        }
    }
    // Custum delegate.
    @IBOutlet @objc public var delegate: GRSegmentedDelegate!
    private var backView = UIView ()
    private var selector = UIView()
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        setupSegment()
        self.backgroundColor = .clear
        initilizeSelector()
    }
    
    
    private func addSubviews() {
        initilizeBackView()
        self.addSubview(backView)
        self.backView.addSubview(selector)
    }
    
    
    private func initilizeBackView() {
        backView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        backView.layer.masksToBounds = true
        backView.alpha = 1
        backView.backgroundColor = self.backgroundColor
        
        switch segmentType {
        case .round, .roundMargin:
            backView.layer.cornerRadius = backView.frame.height / 2
        case .square, .squareMargin:
            backView.layer.cornerRadius = 8
        }
    }
    
    
    private func initilizeSelector() {
        selector.layer.masksToBounds = true
        selector.alpha = 1
        selector.backgroundColor = selectorColor
        switch segmentType {
        case .round, .roundMargin:
            selector.layer.cornerRadius = selector.frame.height / 2
        case .square, .squareMargin:
            selector.layer.cornerRadius = 8
        }
    }
    
    
    // setup segment layouts
    private func setupSegment() {
        for i in 0..<segmentTitles.count {
            if i == selecetdIndex {
                setupSelector(slectedIndex: i)
                if let delegate = delegate {
                    delegate.didSelected(self, at: i)
                }
            }
            let segmentButton = UIButton(frame: CGRect(x: CGFloat(i) * (self.frame.width / CGFloat(segmentTitles.count)), y: 0, width: (self.frame.width / CGFloat(segmentTitles.count)), height: self.frame.height))
            segmentButton.backgroundColor = .clear
            segmentButton.alpha = 1
            segmentButton.tag = i
            segmentButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            segmentButton.setTitle(self.segmentTitles[i], for: .normal)
            segmentButton.titleLabel?.font = titleFont
            if i == selecetdIndex {
                segmentButton.setTitleColor(selectionTitleColor, for: .normal)
            } else {
                segmentButton.setTitleColor(deselectionTitleColor, for: .normal)
            }
            backView.addSubview(segmentButton)
            segmentButtons.append(segmentButton)
        }
    }
    
    // move the selector to a certain index
    private func setupSelector(slectedIndex: Int) {
        switch segmentType {
        case .round:
            selector.layer.cornerRadius = selector.frame.height / 2
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                self.selector.frame = CGRect(x: CGFloat(slectedIndex) * (self.frame.width / CGFloat(self.segmentTitles.count)), y: 0, width: (self.frame.width / CGFloat(self.segmentTitles.count)), height: self.frame.height)
            }, completion: nil)
        case .square:
            selector.layer.cornerRadius = 8
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                self.selector.frame = CGRect(x: CGFloat(slectedIndex) * (self.frame.width / CGFloat(self.segmentTitles.count)), y: 0, width: (self.frame.width / CGFloat(self.segmentTitles.count)), height: self.frame.height)
            }, completion: nil)
        case .roundMargin:
            selector.layer.cornerRadius = selector.frame.height / 2
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                self.selector.frame = CGRect(x: (CGFloat(slectedIndex) * (self.frame.width / CGFloat(self.segmentTitles.count))) + self.selectorMargin / 2, y: self.selectorMargin / 2, width: (self.frame.width / CGFloat(self.segmentTitles.count)) - self.selectorMargin, height: self.frame.height - self.selectorMargin)
            }, completion: nil)
        case .squareMargin:
            selector.layer.cornerRadius = 8
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
                self.selector.frame = CGRect(x: (CGFloat(slectedIndex) * (self.frame.width / CGFloat(self.segmentTitles.count))) + self.selectorMargin / 2, y: self.selectorMargin / 2, width: (self.frame.width / CGFloat(self.segmentTitles.count)) - self.selectorMargin, height: self.frame.height - self.selectorMargin)
            }, completion: nil)
        }
        selector.layer.masksToBounds = true
    }
    
    
    // segment button action
    @objc func buttonAction(sender: UIButton!) {
        for segmentedButton in segmentButtons {
            if sender == segmentedButton {
                segmentedButton.setTitleColor(selectionTitleColor, for: .normal)
            } else {
                segmentedButton.setTitleColor(deselectionTitleColor, for: .normal)
            }
        }
        setupSelector(slectedIndex: sender.tag)
        if let delegate = delegate {
            delegate.didSelected(self, at: sender.tag)
            selecetdIndex = sender.tag
        }
    }
}



