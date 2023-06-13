# 10. Azure Active Directory

Date: 2023-4-25

## Status

Accepted

## Context

Azure Active Directory is a third-party identity broker for software like ArcGIS. The authentication and authorization for the enterprise system is conducted through Azure. 

## Decision

To prevent data breaches and cybersecurity concerns, Azure Active Directory is used to regulate the access to systems, roles, and credentials This hardened solution helps to secure the environment such as guest access. Public resources will not need to have authentication.

## Consequences

San Bernardino County may hire contractors from outside the county. Having guest access will allow these contractors to access the same tools as someone who works for the county. With this hardened solution, Azure Active Directory was the best option as most government entities use this tool and it plays easier with other Microsoft tools.