# 3. Network Analyzer

Date: 2023-6-19

## Status

Accepted

Supported by [4. Manual Digitization of Route Definitions](0004-manual-route-digitization.md)
Supported by [7. Waze](0007-waze.md)

## Context

To generate snowplow routes for a driver to follow a Network Dataset is needed. The Network Dataset defines each road segment, its length and intersections between road segments. To obtain a Network Dataset, San Bernardino County can either develop their own in ArcGIS or purchase a validated dataset from a 3rd party. With the route information published in ArcGIS, there was a needed tool to create a route (turn-by-turn directions) to be used by snowplow drivers.

## Decision

DxHub decided to use the ArcGIS Network Analyst tool to define routes. This is a mature tool, works reliably and allows publication of routes to the ArcGIS portal. 

## Consequences

While Network Analyst can solve for human-defined routes, it is unable to optimize routes based on a criterion like shortest path, least time or most people served. These types of optimizations are currently not available in Network Analyst.
