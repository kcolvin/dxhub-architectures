# 6. Cartegraph

Date: 2023-4-25

## Status

Accepted

Related to [11. See Click Fix](0011-see-click-fix.md)

## Context

Cartegraph is a software that helps with the work order management of San Bernardino's snowplows. It was already in use by San Bernardino for managing physical assets (roadways, stop signs) and maintenance operations (billing and budgeting). 

## Decision

The decision was to continue using the software to include snowplow routes as an additional asset in Cartegraph. It made logical sense to put snowplow routes in there since it already included other San Bernardino County assets. Having the snowplow routes would help snow plows to get around the city and it was the perfect opportunity to integrate the information with Cartegraph.

## Consequences

The addition of snowplow routes scanned and pushed data into cartography led to more load for the system. For those at SBC, there may be push back with additional information put in Cartegraph as it is more work to manage as people may not be properly trained or may not have the time to manage the software.