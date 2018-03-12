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
    
    var textfieldDelegate: UITextFieldDelegate? {
        didSet{
            textField.delegate = textfieldDelegate
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
        imageButtonView.setImage(image, for: .normal)
    }
    
    func addTarget(selector: Selector) {
        imageButtonView.addTarget(nil, action: selector, for: .touchUpInside)
    }
    
    private func addViews() {
        addSubview(textField)
        
        switch state {
        case .hasImage:
            addSubview(imageButtonView)
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
             textField.trailingAnchor.constraint(equalTo: imageButtonView.leadingAnchor, constant: 10),
             textField.topAnchor.constraint(equalTo: topAnchor)
            ].map{$0.isActive = true}
        
        _ = [imageButtonView.trailingAnchor.constraint(equalTo: trailingAnchor),
             imageButtonView.topAnchor.constraint(equalTo: topAnchor),
             imageButtonView.heightAnchor.constraint(equalTo: textField.heightAnchor),
             imageButtonView.widthAnchor.constraint(equalTo: textField.heightAnchor)
            ].map{ $0.isActive = true}
    }
    
    private func drawLine(){
        let line = path()
        UIColor.lightGray.setStroke()
        line.lineWidth = 1
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
            path.addLine(to: CGPoint(x: imageButtonView.frame.maxX, y: textField.frame.maxY + 10))
        case .textfieldOnly:
            path.addLine(to: CGPoint(x: textField.frame.maxX, y: textField.frame.maxY + 10))
        }
        
        return path 
    }
    
    //MARK: - Views
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.disableAutoResizing()
        textField.font = UIFont(name: OpenSans.semiBold.stringValue, size: 14)
        textField.autocorrectionType = .no
        return textField
    }()
    
    private lazy var imageButtonView: UIButton = {
        let button = UIButton()
        button.disableAutoResizing()
        //imageView.backgroundColor = .red
        button.contentMode = .scaleToFill
//        button.image = button.image?.withRenderingMode(.alwaysTemplate)
//        button.tintColor = ChaseColor.blue.color
        return button
    }()
}
