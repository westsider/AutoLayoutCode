//
//  ViewController.swift
//  AutoLayoutCode
//
//  Created by Warren Hansen on 7/11/21.
//

import UIKit

class ViewController: UIViewController {

    let liveImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "warren"))
        imageView.translatesAutoresizingMaskIntoConstraints = false 
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
        
    let instructText: UITextView = {
        let textView = UITextView()
        textView.text = " TURN HEAD LEFT"
        textView.font = UIFont.boldSystemFont(ofSize: 21)
        textView.textAlignment  = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let iconImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "certente"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()
    
    let stackView   = UIStackView()
        
    var myView = DrawView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("imageView Bounds: \(liveImageView.bounds) view bounds: \(view.bounds)")
            //= liveImageView.bounds.width * CGFloat( 0.75)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        layout()
        print("imageView Bounds: \(liveImageView.bounds) view bounds: \(view.bounds)")
        //drawRectangle()
    }
    
  
    

    func style() {

        // image view size is not correct
        print("imageView Bounds: \(liveImageView.bounds) view bounds: \(view.bounds)")
        
        // make crasshair sixw 75% of view
        let crossWidth: CGFloat = view.bounds.width * 0.5
        let crossHeight: CGFloat = crossWidth * 1.5 //  crossWidth * 1.5
        
        var x = liveImageView.bounds.minX  + ( crossWidth / 2 )
        let y = liveImageView.bounds.minY  + ( crossHeight / 3 )
        
        myView = DrawView(frame: CGRect(x: x , y: y, width: crossWidth, height:crossHeight))
        myView.backgroundColor = .clear
        myView.translatesAutoresizingMaskIntoConstraints = false 
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.spacing   = 43.0
    }
    
    func drawRectangle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)

            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)

            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }

        liveImageView.image = img
    }
    
    func layout() {
        
        
        liveImageView.addSubview(myView)
        
        //Stack View
        stackView.addArrangedSubview(liveImageView)
        stackView.addArrangedSubview(instructText)
        stackView.addArrangedSubview(iconImageView)
        self.view.addSubview(stackView)

                
        //Constraints
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        liveImageView.layoutIfNeeded()
        myView.layoutIfNeeded()

        
    }


}

