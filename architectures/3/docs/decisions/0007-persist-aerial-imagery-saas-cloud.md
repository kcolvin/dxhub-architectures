# 7. Large, aerial datasets to persist in SaaS cloud provider storage - not replicated within SBC IT environment

Date: 2022-07-28

## Status

Accepted

Related to [2. NearMap: Wide-Area-Aerial](0002-source-wide-area-aerial-imagery-from-nearmap.md)

Related t0 [3. sUAS: Localized-Aerial](0003-source-highres-localized-aerial-imagery-from-sUAS.md)

## Context

Current practice in SBC is to "swap-and-ship" hard drives containing large-scale surveys (several terabytes) between vendors/partners. Data is copied into the local SBC ArcGIS environment - the process can take weeks/months. SBC-acquired surveys are also donated to [ESRI Community Maps](https://communitymaps.arcgis.com/home/) and made available to a host of online web services, including [AWS Location Service](https://aws.amazon.com/location/).

## Decision

>Persist aerial surveys on service provider cloud infrastructure

## Consequences

Duplication of these large data sets into SBC's IT environment introduces costs, complexity, and latency from the time of capture to availability for analysis. While service outages do occur in the cloud, the global scale of these managed service platforms provides heightened resilience over local hosting in SBC. Furthermore, the confidentiality, integrity, and availability classifications for this data are relatively low.