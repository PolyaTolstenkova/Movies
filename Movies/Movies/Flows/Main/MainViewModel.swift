//
//  MainViewModel.swift
//  Movies
//
//  Created by Polina Tolstenkova on 02.10.2023.
//

import Foundation
import UIKit

class MainViewModel {
    let mockMovies: [Movie] = [
        Movie(
           title: "Title",
           year: 2023,
           genres: ["Horror"],
           rating: 7.6,
           image: UIImage.imagePlaceholder,
           country: "Ukraine",
           description: "oeofhelw;ohf;EWOihfW:PEHOfwEP:OhfwepOhfwpoehfpewohfwepohfp;ewohfpoewhfpoehfowiehfiehwfioehfiwhefihweflihewlifhe"
        ),
        Movie(
           title: "Title",
           year: 2023,
           genres: ["Horror"],
           rating: 7.6,
           image: UIImage.imagePlaceholder,
           country: "Ukraine",
           description: "oeofhelw;ohf;EWOihfW:PEHOfwEP:OhfwepOhfwpoehfpewohfwepohfp;ewohfpoewhfpoehfowiehfiehwfioehfiwhefihweflihewlifhe"
        ),
        Movie(
           title: "Title",
           year: 2023,
           genres: ["Horror"],
           rating: 7.6,
           image: UIImage.imagePlaceholder,
           country: "Ukraine",
           description: "oeofhelw;ohf;EWOihfW:PEHOfwEP:OhfwepOhfwpoehfpewohfwepohfp;ewohfpoewhfpoehfowiehfiehwfioehfiwhefihweflihewlifhe"
        ),
        Movie(
           title: "Title",
           year: 2023,
           genres: ["Horror"],
           rating: 7.6,
           image: UIImage.imagePlaceholder,
           country: "Ukraine",
           description: "oeofhelw;ohf;EWOihfW:PEHOfwEP:OhfwepOhfwpoehfpewohfwepohfp;ewohfpoewhfpoehfowiehfiehwfioehfiwhefihweflihewlifhe"
        )
    ]
    
    func sortAlphabetical() {
        print("Sort option Alphabetical tapped")
    }
    
    func sortHighestRated() {
        print("Sort option Highest Rated tapped")
    }
    
    func sortLowestRated() {
        print("Sort option Lowest Rated tapped")
    }
    
    func sortOldestToNewest() {
        print("Sort option Oldest to Newest tapped")
    }
    
    func sortNewestToOldest() {
        print("Sort option Newest to Lowest tapped")
    }
}
