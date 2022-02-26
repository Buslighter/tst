//
//  ViewController.swift
//  hw10.tables+collections
//
//  Created by gleba on 23.11.2021.
//

import UIKit
struct articleInfo{
        var oldPrice = ""
        var newPrice = ""
        var articleName = ""
        var priceScale = ""
        var j = 1
}
class articleInfoBuilder{

//    func changer() -> (Int,Double,Double){
//        var i = 1
//        var stPrice = 2500.0
//        var ndPrice = 1300.0
//        return (i,stPrice,ndPrice)
//    }
    static func build() -> [articleInfo]{
        let i = 1
        let stPrice = 2500.0
        let ndPrice = 1300.0
//        while i<8 {
//            stPrice = i*2500
//            ndPrice = i*1500
//            i+=1

        return [
            articleInfo(oldPrice: "\(Int(stPrice)) руб", newPrice: "\(Int(ndPrice)) руб", articleName: "Item №\(i)", priceScale: "\(Int((ndPrice/stPrice-1)*100))%", j: i),
            articleInfo(oldPrice: "\(Int(stPrice+500)) руб", newPrice: "\(Int(ndPrice+250)) руб", articleName: "Item №\(i+1)", priceScale: "\(Int((ndPrice/stPrice-1)*100))%", j: i+1),
            articleInfo(oldPrice: "\(Int(stPrice+1000)) руб", newPrice: "\(Int(ndPrice+300)) руб", articleName: "Item №\(i+2)", priceScale: "\(Int((ndPrice/stPrice-1)*100))%", j: i+2),
            articleInfo(oldPrice: "\(Int(stPrice+1500)) руб", newPrice: "\(Int(ndPrice+1000)) руб", articleName: "Item №\(i+3)", priceScale: "\(Int((ndPrice/stPrice-1)*100))%", j: i+3),
            articleInfo(oldPrice: "\(Int(stPrice+2000)) руб", newPrice: "\(Int(ndPrice+500)) руб", articleName: "Item №\(i+4)", priceScale: "\(Int((ndPrice/stPrice-1)*100))%", j: i+4),
            articleInfo(oldPrice: "\(Int(stPrice+2500)) руб", newPrice: "\(Int(ndPrice+1500)) руб", articleName: "Item №\(i+5)", priceScale: "\(Int((ndPrice/stPrice-1)*100))%", j: i+5)
        ]

    }
}

//class articleInfoBuilder{
//    func price() -> [Double:Double]{
//        var i = 1
//        while i<7{
//            i+=1
//        }
//    }
//}

class ViewController: UIViewController {
    var info = articleInfoBuilder.build()

    @IBAction func searchTextfield(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let cell = sender as? UI
//    }


}

extension ViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let w = UIScreen.main.bounds.size.width/2-10
        return CGSize(width: w, height: w)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return info.count
    }

    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ClothShopCollectionViewCell
        cell.articleLabel.text = info[indexPath.row].articleName
        cell.saleScaleLabel.text = info[indexPath.row].priceScale
        cell.oldPriceLabel.text = info[indexPath.row].oldPrice
        cell.salePriceLabel.text = info[indexPath.row].newPrice
        cell.imageView.image=UIImage(named: "images (\(info[indexPath.row].j))")
        cell.saleView.layer.cornerRadius = CGFloat(2)
        
        return cell
    }
}
