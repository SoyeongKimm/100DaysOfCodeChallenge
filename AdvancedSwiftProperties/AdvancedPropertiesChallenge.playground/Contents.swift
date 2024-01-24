import UIKit

var width: Float = 1.5
var height: Float = 2.3

//My solution
//var bucketsOfPaint: Float {
//    get {
//        let sizeOfWholeWalls: Float = width * height * 4
//        let oneBucket: Float = 1.5 * 1.5
//        return sizeOfWholeWalls / oneBucket
//    }
//    set {
//        let totalArea = 1.5 * 1.5 * newValue
//        print(totalArea)
//    }
//}
//
//print(width * height)
//print(bucketsOfPaint)
//bucketsOfPaint = 5



// Solution of the Challenge!
var bucketOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedBuckets = ceilf(numberOfBuckets)
        return Int(roundedBuckets)
    }
    set {
        let areaCanCover = Double(newValue) * 1.5
        print("This amount of paint can cover an area of \(areaCanCover)")
    }
}

//print(bucketOfPaint)
bucketOfPaint = 4


/*
 Round up - Use ceiling rounding up a number either a double or a float.
 ceilf(value)
 */
