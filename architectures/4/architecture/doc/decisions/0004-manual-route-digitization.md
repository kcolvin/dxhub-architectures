# 4. Manual Digitization of Route Definitions

Date: 2023-6-19

## Status

Accepted

## Context

Once a Network Dataset and route layer are defined in ArcGIS, the final step in route digitization is to define the route or path through the street network. Many options to capture routes were investigated including snow plow GPS tracking, using the ESRI QuickCapture app and translating paper route documentation. None of these worked to an adequate level to capture accurate routes. The true turn-by-turn routes exist only in the minds of the snow plow drivers.  They know every turn required to plow both sides all required streets while minimizing left turns, narrow throughways and dead end streets.

## Decision

DxHub and SBC decided to document existing routes with a GIS analyst and a snowplow route driver working together to select each turn in the route using the Network Analyst stop geometry creation tool. The manual documentation allowed for experienced drivers to give input on tricks and turns they learned during the time spent in their role. With the snowplow drivers' help, it provided route definition in ArcGIS Network Analyst. Anyone with the proper credentials will be able to run ArcGIS Navigator and see the published directions.

## Consequences

Documenting routes in this manner is time consuming for the analyst and snow plow driver, taking as much as 60 minutes for each route. Eight routes were digitized for the Running Springs prototype area, taking about 8 hours total.  Documenting future routes will also require a substantial time commitment. 
