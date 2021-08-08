//
//  SongPreview+Ext.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/7/21.
//

import Foundation

extension SongPreview {
    // certainly has some flaws but also I'm just trying to be able to search
    // for Kanye West
    var censoredTitle: String { return title.replacingOccurrences(of: "Nigg", with: "N***") }
}
