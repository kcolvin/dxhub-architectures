# 12. Forward Thinking Telemetry

Date: 2023-6-20

## Status

Accepted

## Context

Forward Thinking: Intellihub is a real-time fleet management software where you can mange vehicle and driver activity. The equipment is already a sunk cost since the plows have the instrumentation for telematic systems such as the open API. By sticking with forward thinking, San Bernardino County can invest in the system.

## Decision

The telemetry being used to automatically track equipment instead of manual entry by snowplow drivers.

## Consequences

Real-time location concerns may lead to push back for snowplow drivers. Although there is a public facing component regarding snowplow work, there must be a time delay regarding the publishing of snowplow route information to keep drivers safe.
