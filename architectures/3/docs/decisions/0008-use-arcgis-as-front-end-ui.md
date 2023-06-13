# 8. ArcGIS to be used for the front-end of the GOTCHA system

Date: 2022-07-28

## Status

Accepted

Supported by [2. NearMap: Wide-Area-Aerial](0002-source-wide-area-aerial-imagery-from-nearmap.md)

Supported by [3. sUAS: Localized-Aerial](0003-source-highres-localized-aerial-imagery-from-sUAS.md)

Supported by [9. Tipping via SeeClickFix](0009-re-use-see-click-fix-as-citizen-tipping-solution.md)

## Context

[Re-Use --> Buy --> Build] is the strategy for IT procurement in SBC - Custom development is not a capability that is a strategic focus for SBC IT.

SBC has a well-established ArcGIS relationship/capability - with several ArcGIS instances deployed across various departments. 

Code Enforcement has built a comprehensive Illegal Dumping Dashboard for tracking dumping activity and abatement efforts. 

Local expertise with ArcGIS tools is strong - with dedicated analysts and developers. [ArcGIS AppStudio](https://www.esri.com/en-us/arcgis/products/arcgis-appstudio/overview) provides a low-code environment for analysts to rapidly develop and deploy map-based solutions. 

## Decision

>Use ArcGIS to create an integrated UI for Code Enforcement to manage and track illegal dumping activity in SBC

## Consequences

ArcGIS is the defacto standard for enterprise-grade mapping solutions. It has a vast partner ecosystem (including NearMap, DroneDeploy, and SeeClickFix). Building custom solutions and data science workflows are becoming more common as enterprises pursue their digital transformation journeys. Re-Using this well-established asset in SBC will create a familiar experience for support and users alike and reduce time-to-value for addressing illegal dumping in SBC and provide a path for continuous improvement of the solution with in-house resources.