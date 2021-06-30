//
//  ProductsCollectionView.swift
//  examen
//
//  Created by BE-006 on 29/06/21.
//

import UIKit

class ProductsCollectionView: UICollectionView {

    var products:Products?
    var productDetails:[ProductDetails]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate = self
    }

    public func setValues(products:Products?){
        self.products = products
        self.productDetails = products?.productDetails
    }
    
    public func addElement(element:Products){
        self.products = element
        self.productDetails = products?.productDetails
        self.reloadData()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, imageView:UIImageView) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                imageView.image = UIImage(data: data)
            }
        }
    }
}

extension ProductsCollectionView:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.numberOfProducts ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        
        let url = URL(string: productDetails![indexPath.row].imageUrl)
        self.downloadImage(from: url!, imageView: cell.imageProduct)
        
        cell.titleProduct.text = productDetails![indexPath.row].title
        cell.priceLabel.text = "\(productDetails![indexPath.row].primaryOffer.offerPrice)"
        cell.currencyLabel.text = productDetails![indexPath.row].primaryOffer.currencyCode
        
        return cell
    }
}

extension ProductsCollectionView:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthCell = collectionView.bounds.width
        
        return CGSize(width: widthCell, height: 200)
    }
}
