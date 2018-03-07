//
//  CustomTextfield.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/6/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class CustomTextfieldView: UIView {
    private let underLineShape = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        drawLine()
    }
    
    convenience init(placeHolder: String) {
        self.init()
        textField.placeholder = placeHolder
        backgroundColor = .clear
        disableAutoResizing()
        addViews()
        setConstraints()
    }
    private func addViews() {
        addSubview(textField)
    }
    
    private func setConstraints() {
        _ = [textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            heightAnchor.constraint(equalTo: textField.heightAnchor, constant: 10)
            ].map{$0.isActive = true}
    }
    private func drawLine(){
        let line = path()
        UIColor.gray.setStroke()
        line.lineWidth = 2
        line.stroke()
        underLineShape.bounds = line.bounds
        underLineShape.path = line.cgPath
        underLineShape.position = CGPoint(x: textField.frame.midX, y: textField.frame.maxY + 10)
        underLineShape.lineWidth = 3
        layer.addSublayer(underLineShape)
    }
    
    private func path() -> UIBezierPath{
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: textField.frame.minX, y: textField.frame.maxY + 10))
        path.addLine(to: CGPoint(x: textField.frame.maxX, y: textField.frame.maxY + 10))
        return path
    }
    
    
    //MARK: - Views
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.disableAutoResizing()
        return textField
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}
