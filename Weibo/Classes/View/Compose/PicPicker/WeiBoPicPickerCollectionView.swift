//
//  WeiBoPicPickerCollectionView.swift
//  Weibo
//
//  Created by ityike on 2017/1/22.
//  Copyright © 2017年 袁 峰. All rights reserved.
//

import UIKit

private let picPickerCell = "picPickerCell"
private let margin: CGFloat = 12


class WeiBoPicPickerCollectionView: UICollectionView {
    
    var images: [UIImage] = [UIImage]() {
        didSet {
            reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // 设置collectionView属性
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let ietmeWidth = (UIScreen.main.bounds.width - 4 * margin) / 3
        layout.itemSize = CGSize(width: ietmeWidth, height: ietmeWidth)
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin
        
        let nibName = UINib(nibName: "WeiBoPicPickerViewCell", bundle: nil)
        register(nibName, forCellWithReuseIdentifier: picPickerCell)
        dataSource = self
        
        // 设置collectionView的内边距
        contentInset = UIEdgeInsets(top: margin, left: margin, bottom: 0, right: margin)
    }
}


extension WeiBoPicPickerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count + 1
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: picPickerCell, for: indexPath) as! WeiBoPicPickerViewCell
        
        // 设置cell数据
        cell.image = (indexPath.item <= images.count - 1) ? images[indexPath.item] : nil
        
        return cell
    }

}
