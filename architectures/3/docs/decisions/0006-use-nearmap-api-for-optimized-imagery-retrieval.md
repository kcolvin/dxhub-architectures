# 6. Use NearMap's WMS API for optimized imagery retrieval

Date: 2022-07-28

## Status

Accepted

Related to [2. NearMap: Wide-Area-Aerial](0002-source-wide-area-aerial-imagery-from-nearmap.md)

## Context

NearMap content can be consumed in custom applications or enterprise systems like ArcGIS using an Application Programmable Interface (API) or Web Map Service (WMS). Authenticating via [API Key Authentication](https://docs.nearmap.com/display/ND/API+Key+Authentication) is required, and users can choose between either a [Simple WMS URL](https://docs.nearmap.com/display/ND/WMS+2.0+Integration#WMS2.0Integration-ObtainingaSimpleWMSURL) or a [Custom WMS URL](https://docs.nearmap.com/display/ND/WMS+2.0+Integration#WMS2.0Integration-ObtainingaCustomWMSURL) to load in their application.

Nearmap provides access to its Vertical and [Panorama Imagery](https://docs.nearmap.com/display/ND/Tile+API#TileAPI-PanoramaImagery) via a [Tile API](https://docs.nearmap.com/display/ND/Tile+API) using [Google Maps Tile Coordinates](https://developers.google.com/maps/documentation/javascript/coordinates), also known as [Slippy Tilenames](https://wiki.openstreetmap.org/wiki/Slippy_map_tilenames). The Tile API is designed to be accessed by an application via URL requests. Mapping frameworks designed to consume tiled maps, such as [OpenLayers](https://openlayers.org/), [Leaflet](http://leafletjs.com/), [Google Maps JavaScript API](https://developers.google.com/maps/documentation/javascript/), etc. are recommended.

The [Tile API](https://docs.nearmap.com/display/ND/Tile+API) is recommended for bulk downloading of large amounts of imagery and can be consumed directly in ArcGIS Online.

SBC's ArcGIS support team has several dedicated analysts, but only one dedicated developer. The use of WMS in SBC is a well-understood integration pattern while writing custom  code to access APIs requires engaging the sole developer or sourcing external talent.

The NearMap AI Feature Layer for waste detection is not in production yet and has been delivered to the team as a [GeoPackage](https://www.geopackage.org/) for this prototype. The expected API definition for the waste AI Feature layer would be expected to resemble the documented [AI Feature API](https://docs.nearmap.com/display/ND/AI+Feature+API) on NearMap. 

## Decision

>The NearMap Web Map Services (WMS) is the preferred integration method for sourcing NearMap imagery and layering of Waste AI Feature inferences for human validation and prioritization.

## Consequences

WMS is a familiar integration pattern in SBC and plays nicely with ArcGIS. While sourcing imagery from the Tile API by providing a programmatically generated polygon representing areas of interest - the efficiencies gained would be lost to support complexity given the small user base of this proposed system and limited developer resources.
