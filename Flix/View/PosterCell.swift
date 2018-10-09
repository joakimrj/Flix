//
//  PosterCell.swift
//  Flix
//
//  Created by Joakim Jorde on 12.09.2018.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet{
            let placeholderImage = UIImage(named: "placeholder")!
            posterImageView.af_setImage(withURL: movie.posterUrl!, placeholderImage: placeholderImage)
        }
        
    }
}

