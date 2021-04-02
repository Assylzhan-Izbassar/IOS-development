//
//  CustomTableViewCell.swift
//  AnimationApp
//
//  Created by macbook on 01.04.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    // First View
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    // Second View
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var processorTitle: UILabel!
    @IBOutlet weak var cameraResolution: UILabel!
    @IBOutlet weak var hideButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        hideButton.layer.cornerRadius = 7
        hideButton.layer.borderWidth = 1
        hideButton.layer.borderColor = UIColor.white.cgColor
    }
    
    /**
     Setting the fields of all custom cells
     */
    func setFields(_ phone: Phone) {
        // main fields
        cellTitle.text = phone.getTitle()
        cellPrice.text = phone.getPrice()
        
        // detail fields
        processorTitle.text = phone.getProcessorType()
        cameraResolution.text = phone.getCameraPixel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func detailAction(_ sender: UIButton) {
        self.detailView.alpha = 1.0
        self.detailView.center.x = self.contentView.frame.width / 2
        UIView.transition(with: detailView, duration: 0.6, options: .transitionFlipFromLeft, animations: {
            self.detailView.isHidden = false
            self.contentView.bringSubviewToFront(self.detailView)
        })
    }
    
    @IBAction func backToMain(_ sender: UIButton) {
        UIView.transition(with: detailView, duration: 0.6, options: .allowAnimatedContent, animations: {
            self.detailView.alpha = 0.0
            self.detailView.center.x = self.contentView.frame.width + self.contentView.frame.width / 2
        })
    }
}
