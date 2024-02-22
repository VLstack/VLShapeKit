import SwiftUI

public
class VLTrianglePoints: ObservableObject
{
 @Published 
 public
 var topMiddle: CGPoint = .zero
 
 @Published
 public
 var bottomRight: CGPoint = .zero
 
 @Published 
 public
 var bottomLeft: CGPoint = .zero
}


extension VLTrianglePoints: Equatable
{
 public
 static func == (lhs: VLTrianglePoints, rhs: VLTrianglePoints) -> Bool
 {
  return    lhs.topMiddle == rhs.topMiddle
         && lhs.bottomRight == rhs.bottomRight
         && lhs.bottomLeft == rhs.bottomLeft
 }
}

//extension VLTrianglePoints: Hashable
//{
// func hash(into hasher: inout Hasher)
// {
//  hasher.combine(topMiddle.x)
//  hasher.combine(topMiddle.y)
//  hasher.combine(bottomRight.x)
//  hasher.combine(bottomRight.y)
//  hasher.combine(bottomLeft.x)
//  hasher.combine(bottomLeft.y)
// }
//}
