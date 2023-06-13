# 2. Source wide-area aerial imagery from NearMap

Date: 2022-07-28

## Status

Accepted

## Context

At the onset of the SBC Illegal Dumping Challenge, the solution vision from the workshop gravitated to the use of aerial imagery for identifying illegal dumping activity in San Bernardino County with the assistance of computer vision.

[Planet Labs](https://www.planet.com/) satellite imagery has been used by the county on an ad-hoc basis in an attempt to identify cannabis grows.

-12in/px, fixed-wing surveys are flown over large swaths of SBC county every year to support various departments by [aero-graphics](https://www.aero-graphics.com/). This data is donated to [ESRI Community Maps](https://communitymaps.arcgis.com/home/) and appears in consumer tools  such as [Google Maps](https://maps.google.com) and [AWS Location Service](https://aws.amazon.com/location/).

SBC presently has an emerging, yet fragmented, in-house UAS capability - disbursed throughout various departments (Fire, Public Works, Sheriff, etc.). SBC is in the early stages of ratifying its UAS policy and in-house UAS program + supporting systems for scaled operations. Standardized training is being developed and delivered at the [SBD Airport](https://flysbd.com/) by the [UAS Center](https://uascentersbd.com/), which which SBC has an existing relationship.

Emerging, subscription-based, cloud-enabled, fixed-wing sourced imagery sets @ 3in/px with multiple flyovers per year (primarily focused on densely populated AOIs) are new entrants in the aerial-survey market and rapidly gaining market share with local and city governments. Broad coverage over San Bernardino's population centers is available. Examples: [NearMap](https://www.nearmap.com/) and [EagleView](https://www.eagleview.com/). 

## Decision

>NearMap is being selected for wide-area aerial imagery given its adequate resolution (3in/px), multiple revisits in a year of areas of interest to SBC for illegal dumping, low capital expense (data-subscription), and their active research in computer vision aided workflows for identifying waste.

## Consequences

SBC can rapidly tap into NearMap's existing aerial data sets captured over the county - which are substantial. Data service is offered via a subscription model, so no capital expenditure is required. The current revisit time for flights over SBC is approximately quarterly which is adequate for monitoring illegal dumping activity in the county. NearMap is an ArcGIS partner and services easily integrate with SBC's existing illegal dumping dashboard built on ArcGIS.

NearMap coverage limitations exist where Code Enforcement operates in the more remote areas of SBC, such as the high-desert and mountainous regions, but the current coverage offered by NearMap offers significant value in its current state - with many of the dumping hot-spots already being surveyed. Options to extend coverage in the future do exist.

Determined that the best satellite imagery available on the market and the aero-graphics annual survey (both ~12in/px) are not adequate to support a computer vision workflow for localized dump site identification. 

UAS is a compelling alternative with high-resolution and on-demand routine flights, "Drone as a Service" subscription models - but absent Beyond Visual Line of Site (BVLOS) waivers from the FAA, remain highly localized. Could be revisited as SBC grows its UAS capabilities and FAA UAS regulations evolve.

