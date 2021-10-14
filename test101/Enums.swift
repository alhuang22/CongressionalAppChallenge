//
//  Enums.swift
//  test101
//
//  Created by Alex Huang on 8/17/21.
//

import Foundation


enum Ownership: String {
    case Public = "Public"
    case PublicES = "Público"
    case PublicZH = "公立"
    case PrivateNonprofit = "Private\nNonprofit"
    case PrivateES = "Privado"
    case PrivateZH = "私立"
    case PrivateProfit = "Private\nProfit"
    case None = "No Data"
    case NoneES = "Sin Datos"
    case NoneZH = "没有数据"
}

enum Locale: String {
    case City = "City"
    case CityES = "Ciudad"
    case CityZH = "城市"
    case Suburb = "Suburb"
    case SuburbES = "Suburbio"
    case SuburbZH = "市郊"
    case Town = "Town"
    case TownES = "Pueblo"
    case TownZH = "镇"
    case Rural = "Rural"
    case RuralZH = "乡村"
    case None = "No Data"
    case NoneES = "Sin Datos"
    case NoneZH = "没有数据"
}

enum Size: String {
    case verySmall = "Very Small"
    case small = "Small"
    case smallES = "Pequeño"
    case smallZH = "小"
    case medium = "Medium"
    case mediumES = "Medio"
    case mediumZH = "中等"
    case large = "Large"
    case veryLarge = "Very Large"
    case largeES = "Grande"
    case largeZH = "大"
    case gradOnly = "Graduates Only"
    case gradES = "Solo Graduados"
    case gradZH = "仅限毕业生"
    case None = "N/A"
}

enum Language: String {
    case EN = "English"
    case ES = "Español"
    case ZH = "中"
}
