import SwiftUI

public struct VLTriangle: Shape
{
 var radiusBottomLeft: CGFloat
 var radiusBottomRight: CGFloat
 var radiusTopMiddle: CGFloat
 var points: VLTrianglePoints?
 
 public init(cornerRadius: CGFloat = 0,
             points: VLTrianglePoints? = nil)
 {
  self.radiusBottomLeft = cornerRadius
  self.radiusBottomRight = cornerRadius
  self.radiusTopMiddle = cornerRadius
  self.points = points
 }
 
 public init(bottomLeftRadius: CGFloat = 0,
             bottomRightRadius: CGFloat = 0,
             topMiddleRadius: CGFloat = 0,
             points: VLTrianglePoints? = nil)
 {
  self.radiusBottomLeft = bottomLeftRadius
  self.radiusBottomRight = bottomRightRadius
  self.radiusTopMiddle = topMiddleRadius
  self.points = points
 }
    
 public func path(in rect: CGRect) -> Path
 {
  let bottomLeft: CGPoint = CGPoint(x: rect.minX, y: rect.maxY)
  let bottomRight: CGPoint = CGPoint(x: rect.maxX, y: rect.maxY)
  let topMiddle: CGPoint = CGPoint(x: rect.midX, y: rect.minY)
          
  var path = Path()
  path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
  path.addArc(tangent1End: bottomRight,
              tangent2End: topMiddle,
              radius: radiusBottomRight)
  path.addArc(tangent1End: topMiddle,
              tangent2End: bottomLeft,
              radius: radiusTopMiddle)
  path.addArc(tangent1End: bottomLeft,
              tangent2End: bottomRight,
              radius: radiusBottomLeft)
    
  if let points
  {
   Task
   {
    @MainActor 
    [ points, topMiddle, bottomRight, bottomLeft ] in
    points.topMiddle = topMiddle
    points.bottomRight = bottomRight
    points.bottomLeft = bottomLeft
   }
  }

  return path
 }
}

#if DEBUG
fileprivate struct VLTriangleWrapper: View
{
 @State private var width: Double = 150
 @State private var height: Double = 150
 @State private var cornerRadius: Double = 1

 var body: some View
 {
  VStack
  {
   LabeledContent("Width")
   {
    Slider(value: $width, in: 0...200, step: 1)
   }
   
   LabeledContent("Height")
   {
    Slider(value: $height, in: 0...200, step: 1)
   }
   
   LabeledContent("Radius")
   {
    Slider(value: $cornerRadius, in: 0.5...2, step: 0.1)
   }
   
   Grid()
   {
    GridRow
    {
     VLTriangle()
      .fill(.orange)
      .frame(maxWidth: width, maxHeight: height)
     
     VLTriangle(cornerRadius: 8 * cornerRadius)
      .fill(.pink)
      .frame(maxWidth: width, maxHeight: height)
     
     VLTriangle(cornerRadius: 16 * cornerRadius)
      .fill(.yellow)
      .frame(maxWidth: width, maxHeight: height)
    }
    
    GridRow
    {
     VLTriangle(bottomLeftRadius: 20 * cornerRadius)
      .fill(.red)
      .frame(maxWidth: width, maxHeight: height)
     
     VLTriangle(bottomRightRadius: 20 * cornerRadius)
      .fill(.green)
      .frame(maxWidth: width, maxHeight: height)
     
     VLTriangle(topMiddleRadius: 20 * cornerRadius)
      .fill(.blue)
      .frame(maxWidth: width, maxHeight: height)
    }
    
    GridRow
    {
     VLTriangle(bottomLeftRadius: 20 * cornerRadius,
                bottomRightRadius: 20 * cornerRadius)
     .fill(.purple)
     .frame(maxWidth: width, maxHeight: height)
     
     VLTriangle(bottomRightRadius: 20 * cornerRadius,
                topMiddleRadius: 20 * cornerRadius)
     .fill(.indigo)
     .frame(maxWidth: width, maxHeight: height)
     
     VLTriangle(bottomLeftRadius: 20 * cornerRadius,
                topMiddleRadius: 20 * cornerRadius)
     .fill(.teal)
     .frame(maxWidth: width, maxHeight: height)
    }
   }
   .frame(maxHeight: .infinity, alignment: .top)
  }
  .padding()
 }
}

#Preview
{
 VLTriangleWrapper()
}
#endif
