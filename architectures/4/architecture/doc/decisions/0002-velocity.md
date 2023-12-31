# 2. Velocity

Date: 2023-6-19

## Status

Accepted

Related to [12. Forward Thinking Telemetry](0012-forward-thinking-telemetry.md)
Related to [9. National Weather Service](0009-national-weather-service.md)

## Context

ArcGIS Velocity provides a new, cloud-native, real-time data ingestion and analysis capability which provides information for the Snow Plow Portal. It is used to locate and track snowplow vehicles to identify which roads have been serviced.

## Decision

DxHub/San Bernardino County decided to implement ArcGIS Velocity for the first time in the County.

## Consequences

Now that San Bernardino County has the license and abilty to utilize Velocity, future implementation of Velocity features is streamlined. County GIS personnel are familiar with its use and capabilities. 

In regards to the Forward Thinking Systems (snowplow vehicle GPS feed), a token is needed to access the API feed. However, the token will expire on April 18, 2024 and will be needed to updated every year. With ArcGIS Velocity's real time data, this information should not be made available to the public. Giving citizens this information can endanger snowplow drivers and create hinderances on their job.
