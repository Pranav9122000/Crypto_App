//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 16/07/23.
//

import Foundation

// JSON Data
/*
 
 URL:   https://api.coingecko.com/api/v3/global

 JSON Response:
 {
     "data": {
       "active_cryptocurrencies": 9941,
       "upcoming_icos": 0,
       "ongoing_icos": 49,
       "ended_icos": 3376,
       "markets": 773,
       "total_market_cap": {
         "btc": 41611692.05730338,
         "eth": 652831390.7698501,
         "ltc": 13334162420.76029,
         "bch": 4978490069.716631,
         "bnb": 5042176783.822229,
         "eos": 1621911355545.1155,
         "xrp": 1684674776927.2153,
         "xlm": 9390058864619.824,
         "link": 184405777404.84778,
         "dot": 233633390609.30905,
         "yfi": 180268355.69041973,
         "usd": 1261509627220.1133,
         "aed": 4633625781549.644,
         "ars": 332681458671029.5,
         "aud": 1844581899940.507,
         "bdt": 136878026918181.78,
         "bhd": 474727518386.5923,
         "bmd": 1261509627220.1133,
         "brl": 6058697700996.621,
         "cad": 1669418765181.7397,
         "chf": 1089017108342.1711,
         "clp": 1021061861748702.4,
         "cny": 9008566398941.568,
         "czk": 26714673998233.55,
         "dkk": 8369359470829.149,
         "eur": 1122689323311.9312,
         "gbp": 963647020079.4103,
         "hkd": 9858445434799.766,
         "huf": 420499004041279.3,
         "idr": 18926428937183370,
         "ils": 4590151636776.418,
         "inr": 103590439926213.92,
         "jpy": 174964962735461.3,
         "krw": 1601272015119310.5,
         "kwd": 385681338330.0059,
         "lkr": 403321916811712.06,
         "mmk": 2642574272787243.5,
         "mxn": 21125057298532.098,
         "myr": 5709592572798.259,
         "ngn": 978388793249863.9,
         "nok": 12679830638721.969,
         "nzd": 1980547407562.2908,
         "php": 68563052023942.22,
         "pkr": 344793356414067.44,
         "pln": 5004684961790.5625,
         "rub": 113854660024685.92,
         "sar": 4734012933154.947,
         "sek": 12805741914614.809,
         "sgd": 1666328066595.049,
         "thb": 43615122258630.19,
         "try": 33014085397238.586,
         "twd": 38910633696790.84,
         "uah": 46238751951879.97,
         "vef": 126314958973.54993,
         "vnd": 29826458635082224,
         "zar": 22839764259331.02,
         "xdr": 937454295689.4408,
         "xag": 50563538731.022514,
         "xau": 645035102.5901877,
         "bits": 41611692057303.375,
         "sats": 4161169205730337.5
       },
       "total_volume": {
         "btc": 1028569.7304764783,
         "eth": 16136873.423124248,
         "ltc": 329597648.38122755,
         "bch": 123059744.4135778,
         "bnb": 124633970.86590086,
         "eos": 40090869737.5833,
         "xrp": 41642273975.74471,
         "xlm": 232106166272.68634,
         "link": 4558194857.887773,
         "dot": 5775017110.056347,
         "yfi": 4455924.882136334,
         "usd": 31182356523.171906,
         "aed": 114535290098.13203,
         "ars": 8223315644279.947,
         "aud": 45594904072.89509,
         "bdt": 3383390299570.2915,
         "bhd": 11734450859.730505,
         "bmd": 31182356523.171906,
         "brl": 149760626238.67264,
         "cad": 41265171504.93961,
         "chf": 26918637003.975998,
         "clp": 25238899742226.293,
         "cny": 222676326167.62332,
         "czk": 660340968502.0812,
         "dkk": 206876226117.33243,
         "eur": 27750956464.29252,
         "gbp": 23819703230.34668,
         "hkd": 243683879757.28442,
         "huf": 10394014899868.865,
         "idr": 467828894917148.3,
         "ils": 113460683727.63132,
         "inr": 2560578183845.9224,
         "jpy": 4324834095085.894,
         "krw": 39580700605557.9,
         "kwd": 9533381859.829365,
         "lkr": 9969426734654.229,
         "mmk": 65319908255155.78,
         "mxn": 522175220895.34155,
         "myr": 141131345623.8767,
         "ngn": 24184094604669.984,
         "nok": 313423687856.70654,
         "nzd": 48955738458.96255,
         "php": 1694761170581.4673,
         "pkr": 8522701004047.567,
         "pln": 123707237263.50183,
         "rub": 2814292118037.734,
         "sar": 117016688483.17668,
         "sek": 316535998861.2843,
         "sgd": 41188774731.45781,
         "thb": 1078091092390.0822,
         "try": 816051624918.3672,
         "twd": 961804195778.9774,
         "uah": 1142942723098.581,
         "vef": 3122289358.6652026,
         "vnd": 737258953015102.8,
         "zar": 564559838999.4625,
         "xdr": 23172263961.856106,
         "xag": 1249844042.219781,
         "xau": 15944162.537428243,
         "bits": 1028569730476.4784,
         "sats": 102856973047647.83
       },
       "market_cap_percentage": {
         "btc": 46.695409485492576,
         "eth": 18.411911637314514,
         "usdt": 6.629148050230905,
         "xrp": 3.1359512603695885,
         "bnb": 3.0900087092421478,
         "usdc": 2.1626790377643776,
         "steth": 1.18438422303706,
         "sol": 0.8971087013990621,
         "ada": 0.897059171457188,
         "doge": 0.7932751660579881
       },
       "market_cap_change_percentage_24h_usd": -0.12252155651919086,
       "updated_at": 1689508843
     }
   }
 */


struct GlobalData: Codable{
    let data: MarketDataModel?
}

struct MarketDataModel: Codable{
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
//    var marketCap: String {
//        if let item = totalMarketCap.first(where: { (key, value) in
//            return key == "usd"
//        }) {
//            return "\(item.value)"
//        }
//        return ""
//    }
        
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }

}

