//
//  FilterManager.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 16/01/2019.
//  Copyright © 2019 Elsa Jeannin. All rights reserved.
//

import Foundation
import CoreImage

class FilterManager {
    let filterName: String
    var filterEffectValue: Any?
    var filterEffectValueName: String?
    
    init(filterName: String, filterEffectValue: Any?, filterEffectValueName: String?) {
        self.filterName = filterName
        self.filterEffectValue = filterEffectValue
        self.filterEffectValueName = filterEffectValueName
    }

}
