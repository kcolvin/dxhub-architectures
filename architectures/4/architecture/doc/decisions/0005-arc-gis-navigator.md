# 5. ArcGIS Navigator

Date: 2023-4-25

## Status

Accepted

Supported by [3. Network Analyzer](0003-network-analyzer.md)
Supported by [8. Cyclomedia](0008-cyclomedia.md)

## Context

Digitized turn-by-turn route directions for snow plow drivers are created in the Network Analyst tool inside ArcGIS. Once published, the directions need to be presented in a mobile app to the drivers at the wheel for both training and operational scenarios. 

## Decision

ArcGIS Navigator was selected as the mobile app as its source for routes is the ArcGIS Portal. As soon as a route is solved and exported in the Network Analyst, it becomes available to ArcGIS Navigator. 

## Consequences

Updates or changes to routes can be quickly and easily distributed by GIS analysts. Additionally, if there is an obstacle (e.g. parked car, fallen tree), an analyst can rapidly define a line barrier to represent an obstacle, then solve, then publish the route once again. With a network connection, ArcGIS Navigator can receive the update and display the updated route on the fly.
