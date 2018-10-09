//
//  MovieCell.swift
//  Flix
//
//  Created by Joakim Jorde on 09.09.2018.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    //var movie: Movie!
    var movie: Movie! {
        didSet{
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            let placeholderImage = UIImage(named: "placeholder")!
            posterImageView.af_setImage(withURL: movie.posterUrl!, placeholderImage: placeholderImage)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
