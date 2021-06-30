//
//  ProductCollectionViewCell.swift
//  examen
//
//  Created by BE-006 on 29/06/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
