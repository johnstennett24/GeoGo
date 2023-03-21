//
// Created by John Stennett on 2/28/23.
//

import Foundation
import SwiftUI
import HeadingIndicator
import MapKit




struct CompassMarkerView: View {
    let marker: Marker
    let compassDegrees: Double

    var body: some View {
        VStack {
            Text(marker.degreeText())
                    .fontWeight(.light)
                    .rotationEffect(textAngle())

            Capsule()
                    .frame(width: capsuleWidth(),
                            height: capsuleHeight())
                    .foregroundColor(capsuleColor())
                    .padding(.bottom, 120)

            Text(marker.label)
                    .fontWeight(.bold)
                    .rotationEffect(textAngle())
                    .padding(.bottom, 80)
        }.rotationEffect(Angle(degrees: marker.degrees))
    }

    private func capsuleWidth() -> CGFloat {
        marker.degrees == 0 ? 7 : 3
    }

    private func capsuleHeight() -> CGFloat {
        marker.degrees == 0 ? 45 : 30
    }

    private func capsuleColor() -> Color {
        marker.degrees == 0 ? .red : .gray
    }

    private func textAngle() -> Angle {
        Angle(degrees: compassDegrees - marker.degrees)
    }
}