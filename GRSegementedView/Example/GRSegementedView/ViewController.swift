//
//  ViewController.swift
//  GRSegementedView
//
//  Created by gregorywlsn on 09/07/2019.
//  Copyright (c) 2019 gregorywlsn. All rights reserved.
//

import UIKit
import GRSegementedView

class ViewController: UIViewController {

    @IBOutlet weak var segmentView: GRSegmentedView!
    @IBOutlet weak var segmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentView.segmentTitles = ["One", "Two", "Three"]
        segmentView.selectionTitleColor = .white
        segmentView.deselectionTitleColor = .black
        segmentView.selectorColor = .brown
        segmentView.delegate = self
        segmentView.segmentType = .squareMargin
        segmentLabel.text = "Selecetd Index: \(segmentView.selecetdIndex)"
    }
}

extension ViewController: GRSegmentedDelegate {
    func didSelected(_ segmentControl: GRSegmentedView, at index: Int) {
        print("Selecetd Index: ", index)
        segmentLabel.text = "Selecetd Index: \(index)"
    }
}

