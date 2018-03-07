//
//  CustomTextfield.swift
//  SimpleChaseClone
//
//  Created by Jermaine Kelly on 3/6/18.
//  Copyright © 2018 Jermaine Kelly. All rights reserved.
//

import UIKit

class CustomTextfieldView: UIView {
    enum CustomTextfieldViewState {
        case hasImage
        case textfieldOnly
    }
    
    private var state = CustomTextfieldViewState.textfieldOnly
    private let underLineShape = CAShapeLayer()
    var image: UIImage? {
        didSet{
            addImageView()
        }
    }
    
    override func draw(_ rect: CGRect) {
        drawLine()
    }
    
    convenience init(placeHolder: String, type: CustomTextfieldViewState) {
        self.init()
        self.state = type
        textField.placeholder = placeHolder
        backgroundColor = .clear
        disableAutoResizing()
        addViews()
    }
    private func addImageView() {
        imageView.image = image
        //state = .hasImage
    }
    
    private func addViews() {
        addSubview(textField)
        
        switch state {
        case .hasImage:
            addSubview(imageView)
            setConstraintsWithImageView()
        case .textfieldOnly:
            setConstraintsWithoutImageView()
        }
    }
    
    private func setConstraintsWithoutImageView() {
        heightAnchor.constraint(equalTo: textField.heightAnchor, constant: 10).isActive = true
        
        _ = [textField.leadingAnchor.constraint(equalTo: leadingAnchor),
             textField.trailingAnchor.constraint(equalTo: trailingAnchor),
             textField.topAnchor.constraint(equalTo: topAnchor),
             ].map{$0.isActive = true}
    }
    
    private func setConstraintsWithImageView() {
        heightAnchor.constraint(equalTo: textField.heightAnchor, constant: 10).isActive = true
        
        _ = [textField.leadingAnchor.constraint(equalTo: leadingAnchor),
             textField.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
             textField.topAnchor.constraint(equalTo: topAnchor)
            ].map{$0.isActive = true}
        
        _ = [imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
             imageView.topAnchor.constraint(equalTo: topAnchor),
             imageView.heightAnchor.constraint(equalTo: textField.heightAnchor),
             imageView.widthAnchor.constraint(equalTo: textField.heightAnchor)
            ].map{ $0.isActive = true}
    }
    
    private func drawLine(){
        let line = path()
        UIColor.lightGray.setStroke()
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
        
        switch state {
        case .hasImage:
            path.addLine(to: CGPoint(x: imageView.frame.maxX, y: textField.frame.maxY + 10))
        case .textfieldOnly:
            path.addLine(to: CGPoint(x: textField.frame.maxX, y: textField.frame.maxY + 10))
        }
        
        return path 
    }
    
    //MARK: - Views
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.disableAutoResizing()
        textField.font = UIFont(name: OpenSans.semiBold.stringValue, size: 13)
        textField.autocorrectionType = .no
        return textField
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoResizing()
        //imageView.backgroundColor = .red
        imageView.contentMode = .scaleToFill
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = ChaseColor.blue.color
        return imageView
    }()
}
