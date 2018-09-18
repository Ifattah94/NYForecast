//
//  ViewController.swift
//  NYForecast
//
//  Created by C4Q on 9/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
   let cellSpacing = UIScreen.main.bounds.size.width * 0.02
    
    var forecasts = [Forecast]() {
        didSet {
           collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadForecast()
      let nib = UINib(nibName: "ForecastCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "ForecastCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func loadForecast() {
        AerisAPI.manager.getForecast(completionHandler: { (forecasts) in
            self.forecasts = forecasts
        }, errorHandler: {print($0)})
    }
    
   

}
extension ForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCell", for: indexPath) as! ForecastCell
         let thisForecast = forecasts[indexPath.row]
        cell.forecast = thisForecast
        cell.configureCell(with: thisForecast)
        return cell
    }
}
extension ForecastViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 2
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / (numCells + 0.4), height: screenHeight * 0.30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}


    
   
    
    


