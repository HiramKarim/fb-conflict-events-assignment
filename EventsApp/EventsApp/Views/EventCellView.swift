//
//  EventCellView.swift
//  EventsApp
//
//  Created by Hiram Castro on 21/08/21.
//

import UIKit

class EventCellView: UICollectionViewCell {
    
    private let eventName:UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let eventStartDate:UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let eventEndDate:UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .white
        
        addViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        eventName.text = ""
        eventStartDate.text = ""
        eventEndDate.text = ""
    }
    
    private func addViews() {
        self.contentView.addSubview(eventName)
        self.contentView.addSubview(eventStartDate)
        self.contentView.addSubview(eventEndDate)
        
        NSLayoutConstraint.activate([
            eventName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            eventName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            
            eventStartDate.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 20),
            eventStartDate.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            
            eventEndDate.topAnchor.constraint(equalTo: eventStartDate.bottomAnchor, constant: 10),
            eventEndDate.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
        ])
    }
    
    func configCell(event:EventModel?) {
        DispatchQueue.main.async {
            self.eventName.text = event?.eventTitle ?? ""
            self.eventStartDate.text = "start: ".appending(event?.eventStartDate ?? "")
            self.eventEndDate.text = "end: ".appending(event?.eventEndDate ?? "")
        }
    }
    
}
