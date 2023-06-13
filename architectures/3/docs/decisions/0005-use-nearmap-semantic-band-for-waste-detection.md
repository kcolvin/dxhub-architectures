# 5. Use NearMap's semantic-bands for computer vision aided waste detection

Date: 2022-07-28

## Status

Accepted

Supported by [2. NearMap: Wide-Area-Aerial](0002-source-wide-area-aerial-imagery-from-nearmap.md)

Supported by [6. NearMap: API](0006-use-nearmap-api-for-optimized-imagery-retrieval.md)

## Context

SBC and the DxHUB have been working closely with NearMap on a new AI service for waste detection. NearMap operates around the world and has a team of data scientists focused on bringing computer vision to bear on their existing aerial assets to create value for their customers. Tagging and training of existing assets are facilitated by a team of specialists.

SBC does not have an in-house data science capability today and it is not a strategic priority at this time for SBC IT to develop in-house computer vision skills.

The [California Department of Resources Recycling and Recovery](https://calrecycle.ca.gov/Tires/Grants/Cleanup/) manages the [Waste Tire Cleanup Grant](https://www2.calrecycle.ca.gov/Docs/Web/111834) which funds the collection, removal, transportation, recycling, and disposal of California waste tires from tire piles and areas where illegal dumping has occurred (up to $100,000 for a single jurisdiction). Funds are limited to the removal of waste tires along public rights-of-way and on private property.

San Bernardino County Code Enforcement was awarded a [$100,000 grant for FY 2022/23](https://www2.calrecycle.ca.gov/funding/grants/bycycle/765)

    NOTE: Feature enhancements submitted to NearMap include the ability to leverage their waste detection model on imagery not sourced from NearMap surveys via an API (i.e. UAS imagery captured in-house). There is also an opportunity to improve the feedback mechanism (human-in-the-loop) for SBC Code Enforcement's analysis of model-driven dumping tips to be used to improve future model performance. Additionally, the "Bring Your Own Model" (BYOM) capability platform providers are beginning to embrace will allow simplified deployment options should SBC further develop its internal computer vision capabilities.

## Decision

>NearMap waste detection model will be used to generate automated suggestions on potential illegal tire dumping given the consistent aerial image characteristics of tires (round, black, standard size, etc.) for easier detection. Furthermore, the monetary incentives offered by the state of California via the Waste Tire Cleanup Grant will drive further adoption of this solution by other jurisdictions within California.

## Consequences

By partnering v. building out this novel approach to auto-detection of waste-tires using aerial imagery, SBC/AWS/NearMap will shrink the time-to-value for addressing the challenge of illegal tire dumping in SBC - as well as in jurisdictions across California which have been incentivized by the California Waste Tire Cleanup Grant to identify illegal tire-dumping. SBC will be able to rapidly tap into NearMap's ever-improving computer vision capabilities via a simple API call in the context of a pay-as-you-go model. 

There will be trade-offs in leveraging NearMap's global model performance relative to a localized SBC model for detecting tires from aerial imagery - this performance should continually be assessed and this ADR revisited in the future to consider deploying a custom model for more accurate tagging of waste-tires. 
