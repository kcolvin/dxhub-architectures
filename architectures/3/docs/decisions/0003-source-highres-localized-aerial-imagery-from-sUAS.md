# 3. Source high-res, localized-aerial imagery from sUAS

Date: 2022-07-28

## Status

Accepted

Related to [2. NearMap: Wide-Area-Aerial](0002-source-wide-area-aerial-imagery-from-nearmap.md)

Supported by [4. Code Enforcement Pilots](0004-develop-code-enforcement-uas-capabilities.md)

## Context

Small Unmanned Aerial Systems are currently in use with various SBC departments today. While limited in range and restricted by the FAA to visual line of site operations, they can produce very high-resolution imagery for more detailed analysis of dump sites. This detailed imagery can supplement wide-area imagery captured by fixed-wing or satellite-based platforms to analyze dumping hot spots and aid in abatement planning activities (waste classification, volume estimation, progress tracking, community outreach imagery). 

Automated, cloud-based platforms like [DroneDeploy](https://www.dronedeploy.com/) and [ESRI Site Scan](https://www.esri.com/en-us/arcgis/products/site-scan-for-arcgis/overview) make capturing this ground-truth imagery and acting on insights a seamless activity. SBC currently does not have a unified UAS platform, though it should be noted that [Pix4D](https://www.pix4d.com/) is used by Public Works for ad-hoc missions.

## Decision

>sUAS surveys and ground-based image capture to be used on an as-needed basis to capture more detailed imagery of dumping hot spots.

## Consequences

Facilitates planning for abatement activities such as annotations, issue reporting, volume calculations, Flock LPR camera deployment planning, etc. Detailed imagery can also be used for communications and raising general awareness of illegal dumping activities in SBC.
