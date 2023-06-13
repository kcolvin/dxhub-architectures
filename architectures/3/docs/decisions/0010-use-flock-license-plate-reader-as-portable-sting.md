# 10. Use Flock portable license plate reader (LPR) cameras and associated cloud platform

Date: 2022-07-28

## Status

Accepted

Supported by [3. sUAS: Localized-Aerial](0003-source-highres-localized-aerial-imagery-from-sUAS.md)

Supported by [9. Tipping via SeeClickFix](0009-re-use-see-click-fix-as-citizen-tipping-solution.md)

## Context

SBC Code Enforcement has repurposed [Bushnell trail cameras](https://www.bushnell.com/trail-cameras-2/) for monitoring dumping hot spots with mixed results. The volume of imagery is difficult to parse through manually and the quality is rarely adequate to pursue a citation against the offenders captured in the imagery. Additionally, the required man hours to mount and maintain these cameras with no visibility into image quality or captured events makes the ROI on this type of deployment low.

Higher-end, fixed-camera installations are not common in unincorporated SBC where Code Enforcement has jurisdiction. Traditional installations to support AI-enabled cameras are costly to deploy - requiring power and robust communication infrastructure. Illegal dumping, by its nature, occurs in low-traffic areas - away from established infrastructure and communications (desert, empty lots, remote roads, etc.). Much research was conducted to explore off-grid solutions that could use computer vision, but few exist in the market. Developing custom hardware was considered but deemed an ineffective use of resources.

SBC Sheriff and other law enforcement agencies have been exploring and deploying portable [Flock Safety Cameras](https://www.flocksafety.com/) and associated cloud platform for tracking vehicles in their communities that have been associated with criminal activity. Flock solution uses computer vision running on the camera to register license plates and escalate alerts for flagged vehicles in real-time - the imagery is transmitted wirelessly over cell networks to the AWS cloud for further inference (vehicle make, model, color, stickers, luggage rack, trailer, etc.). Flock cameras can run for a week on a full charge or indefinitely with a small solar panel. Cameras are rapidly deployable by Code Enforcement personnel where cellular connectivity is available (no special technical skills required). Cameras have a wide range of focal lengths for differing environments. 

    NOTE: Discussions with Flock to include detection of vehicles carrying mixed loads vs. empty has been highlighted as a desirable feature for this illegal dumping workflow - Speaking with the head of Flock ML, there is an opportunity place request this feature on Flock's product roadmap. Flock has also expressed interest in leveraging Cal Poly's Private 5g Innovation lab for testing enhanced, remote deployment architectures. 

## Decision

>Leverage portable, battery/solar powered, cell-enabled Flock cameras and associated cloud platform on AWS to aid in the prosecution of illegal dumping offenders at dumping hotspots. 

## Consequences

Enforcement of illegal dumping is particularly challenging - particularly in SBC which is the largest county by landmass in the continental US. Flock cameras will be a useful tool to equip Code Enforcement with rapidly re-deployable cameras and analysis tools to identify and prosecute illegal dumping offenders, deter future offenses, and support other related code enforcement activities. 