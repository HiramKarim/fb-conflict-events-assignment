//
//  SectionHeaderView.swift
//  EventsApp
//
//  Created by Hiram Castro on 22/08/21.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    private var headerTitle: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .darkGray
        
        configHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configHeader() {
        addSubview(headerTitle)
        
        NSLayoutConstraint.activate([
            headerTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setTitle(title:String) {
        DispatchQueue.main.async {
            self.headerTitle.text = title
        }
    }
    
}
