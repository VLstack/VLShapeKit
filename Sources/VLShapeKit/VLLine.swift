import SwiftUI

public struct VLLine: Shape
{
 public init() {}
 
 public func path(in rect: CGRect) -> Path
 {
  var path = Path()
  path.move(to: CGPoint(x: 0, y: 0))
  path.addLine(to: CGPoint(x: rect.width, y: rect.height))

  return path
 }
}
