//
//  TagCollectionView.swift
//  examen
//
//  Created by BE-006 on 29/06/21.
//

import UIKit

class TagCollectionView: UICollectionView {
    
    var tags:[String] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate = self
    }

    public func setValues(tags:[String]){
        self.tags = tags
    }
    
    func calculateWidth(text:String) -> CGFloat{
        let totalWidthLetters = CGFloat(text.count * 13)
        
        return totalWidthLetters
    }
    
    public func addElement(element:String){
        tags.append(element)
        self.reloadData()
    }
}

extension TagCollectionView:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TagCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCollectionViewCell
        
        cell.tagLabel.text = tags[indexPath.row]
        cell.firstView.layer.cornerRadius = 5
        
        return cell
    }
}

extension TagCollectionView:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthCell = calculateWidth(text: tags[indexPath.row]) + 30
        
        return CGSize(width: widthCell, height: 30)
    }
}
