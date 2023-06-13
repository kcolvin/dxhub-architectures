/*
 * This is a a reference architecture for the San Bernardino IllegalDumping challenge - facilitated by the Cal Poly DxHUB
*/

workspace "San Bernardino Illegal Dumping Challenge" "This is a reference architecture model of the GOTCHA Software System " {
!docs docs
!adrs docs/decisions


    model {
    
        gotcha = softwareSystem "GOTCHA" "Ground Observational Technologies Changing Hazardous Attitudes"{

            lpr = container "LPR" "AI License Plate Readers (LPR)" "Flock LPR" {
                flockCamera = component "flockCamera" "Off-grid LRP Camera" "Cell"
                flockWeb = component "flockWeb" "Cloud-based image analysis and LPR camera management" "AWS" "Web App"
                flockDeviceMobile = component "flockDeviceMobile" "Mobile app for configuring and managing Flock LPR cameras" "android/iOS" "Mobile App"
                flockPatrolMobile = component "flockPatrolMobile" "Mobile app for taking a picture of a LP from a mobile and checking watch list" "android/iOS" "Mobile App"
                flockAI = component "flockAI" "Computer vision model supporting vehicle license plate reading" "Edge,ONYX" "API"
                flockAlert = component "flockAlert" "Near-real time alert of hit on LP registered on watch list"                
            }

            uas = container "UAS" "Unmanned Aerial Systems" "DroneDeploy" {
                uasFlightApp = component "FlightApp" "Executes preplanned flight via compatible SDKs" "android/iOS" "Mobile App"                 
                uasMappingEngine = component "MappingEngine" "Cloud based mapping engine for creating geo-accurate high resolution aerial assets" "Cloud"
                uasImageService = component "AerialImageryService" "Web Map Services for easy integration of aerial assets" "WMS" "API"
                uasMgmtConsole = component "ManagementConsole" "Web-based management console for UAS missions" "HTML" "Web App"
                uasTrainProg = component "TrainingProgram" "Commercial UAS instruction and certification" "Classroom" "Person"
            }

            fws = container "FWS" "Fixed Wing Surveys" "NearMap" {
                nmAiFeatures = component "NearMapAIFeatures" "Waste classification computer vision model" "REST" "API"
                nmWMS = component "NearMapWMS" "Web Map Service for user-friendly retrieval of NearMap aerial assets from GIS systems" "WMS" "API"
                nmTileApi = component "NearMapTileAPI" "TileAPI for efficient retrieval of NearMap aerial assets from custom applications" "REST" "API"
                nmMapBrowser = component "NearMapBrowser" "Web-based map browser for interacting with NearMap aerial imagery" "HTML" "Web App"
            }

            tip = container "TIP" "Citizen illegal dumping tipping" "SeeClickFix Conversations" "Civic Plus" {
                scfMobileApp = component "SCFMobileApp" "Mobile application providing local waste management resources and illegal dumping reporting" "android/iOS" "Mobile App"
                scfSmsHandler = component "SCFSmsHandler" "API for logging illegal dumping reports submitted via SMS" "Rest" "API"
                scfEmailHandler = component "SCFEmailHandler" "API for logging illegal dumping reports submitted via email" "REST" "API"
            }

            gis = container "GIS" "SBC Illegal Dumping Dashboard" "ArcGIS Online" 

        }

        # External Actors
        uasCenter = person "UAS Center" "FAA Part 107 commercial UAS training/certification center for SBC"
        hauler = person "Hauler" "3rd party waste haulers contracted to abate illegal dump sites"
        citizen = person "Citizen" "SBC citizen ally in combating illegal dumping in their community"
        cea = person "Code Enforcement" "Code Enforcement agent tasked tasked with identification, cleanup, and citation of illegal dumping activity"
        DaaS = person "Drone-as-a-Service Pilot" "Contract sUAS pilots available for hire through managed service provider"
        gisAdmin = person "GIS Admin" "GOTCHA GIS administrator responsible for illegal dumping dashboard and supporting services"
        dumper = person "Illegal Dumper" "Suspected illegal dumper"
        
        # External services
        nearmap = softwareSystem "NearMap" "Data and AI service provider of high-res aerial imagery and AI feature extraction over densely populated AOIs" "External Service"
        flock = softwareSystem "Flock Safety Systems" "Provider of re-deployable, cloud based License Plate Readers (LPR)" "External Service"
        dd = softwareSystem "DroneDeploy" "Provider of fully integrated, cloud based unmanned systems for aerial and ground based mapping and analysis" "External Service"
        scf = softwareSystem "Civic Plus SeeClickFix" "Provider of Citizen Relationship Management Platform" "External Service"
        
        # Container Relations
        lpr -> flock "Flock provides camera hardware, computer vision, and management platform via subscription"
        uas -> dd "DroneDeploy provides sUAS fleet management, flight planning/execution, image processing, and collaboration capabilities"
        fws -> nearmap "Routine fixed wing aerial survey data and AI features"
        tip -> scf "Citizen Relationship Management data"
        gis -> hauler "Abatement Work Order prioritized and issued"
        gis -> fws "Wide-area, scheduled, in. level resolution aerial imagery and waste classification sourced from NearMap" 
        gis -> uas "Localized, on-demand, cm. level resolution aerial imagery, volumetric model, elevation profile, and issue tags/annotations" 
        gis -> lpr "Location data for deployed cameras"
        gis -> tip "Illegal dumping tip location data"
        lpr -> cea "Portable LPR cameras deployed by Code Enforcement"
        #uas -> cea "sUAS flight execution for FAA Part 107 Code Enforcement Agents"
        cea -> gis "Integrated aerial imagery, inferred dump sites, work order tracking and reporting"
        uas -> uascenter  "Approved curriculum for training SBC pilots and providing FAA Part 107 certification"
        uas -> DaaS "Vetted flight plans delivered to certified FAA Part 107 UAS pilots for fulfillment"
        gisAdmin -> gis "GIS Admin manages ArcGIS environment, dashboard configuration, and integrations to other GOTCHA datastores"
        gisAdmin -> fws "GIS Admin manages subscription, WMS services, roles/access, etc"
        citizen -> tip "Submits Tip of illegal dumping through preferred media (sms, email, app, etc)"
        citizen -> tip "Waste management resources and information"
        # Component Relations

            # NearMap
            gisAdmin -> nmMapBrowser "GIS Admin manages subscription, WMS services, roles/access, etc"
            gisAdmin -> nmTileApi "*FUTURE: GIS developer pattern for custom applications"
            gis -> nmWMS "High resolution vertical imagery sourced from NearMap" 
            gis -> nmAiFeatures "NearMap AI feature layer w/auto classified waste from aerial survey imagery"
            nmAiFeatures -> nearmap "AI feature layers"
            nmTileApi -> nearmap "Aerial imagery"
            nmWMS -> nearmap "Aerial imagery"
            nmMapBrowser -> nearmap "Aerial imagery, custom layers, annotations, system administration, etc."

            # DroneDeploy
            uasTrainProg -> uascenter "Approved curriculum for training SBC pilots and providing FAA Part 107 certification"
            uasMgmtConsole -> DaaS "Request for 3rd party pilot to execute validated flight plan"
            uasFlightApp -> dd "Flight plans, airspace clearance, and datastore"
            uasImageService -> dd "Image assets and metadata"
            uasMappingEngine -> dd "Image processing workloads"
            uasMgmtConsole -> dd "Flight plans, aerial imagery, reporting, fleet/pilot data, admin functions, etc"
            uasFlightApp -> cea "FAA Part 107 Code Enforcement Pilot executes preplanned mission from mobile app connected to UAS controller"
            cea -> uasTrainProg "Code Enforcement agents attend standard SBC FAA Part 107 to become certified commercial UAS pilots"
            cea -> uasMappingEngine "Upload UAS imagery captured from field locations"
            cea -> uasMgmtConsole "Plan flights, processed maps, and plan abatement activities"
            gis -> uasImageService "Web map service, annotations, and issue markers"

            # Flock
            cea -> flockAlert  "Alert sent to Code Enforcement Agent's mobile device"
            cea -> flockPatrolMobile "Take and upload photos suspicious vehicle license plates"
            cea -> flockDeviceMobile "Activate and deploy portable LPR cameras"
            flockCamera -> dumper  "Video evidence linking dumping activity to dumper via license plate recognition"
            flockAlert -> flockAI "Suspect vehicle detection"
            flockPatrolMobile -> flockAI "Suspect vehicle detection"
            flockCamera -> flockAI "Runs local edge CV model for license plate identification "
            flockCamera -> flock "Sends optimized stream of images to cloud data store for further processing"
            flockPatrolMobile -> flock "Shared data store of flagged license plates"
            flockDeviceMobile -> flock "LPR camera asset and activation information"
            flockAI -> flock "Vehicle recognition computer vision i.e. color, make, model, rack, trailer, etc."
            flockAlert -> flock "Shared data store of flagged license plates"
            flockWeb -> flock "Camera management, image management, visual search, system administration, etc."

            # Civic Plus
            citizen -> scfMobileApp "Waste management resources and information"
            citizen -> scfMobileApp "Submits tip of illegal dumping through app"
            citizen -> scfSMSHandler "Submits tip of illegal dumping through SMS"
            citizen -> scfEmailHandler "Submits tip of illegal dumping through email"
            scfMobileApp -> scf "Citizen tips logged"
            scfSmsHandler -> scf "Citizen tips logged"
            scfEmailHandler -> scf "Citizen tips logged"
    
    }

        views {
            
        systemContext gotcha "gotchaContext" "GOTCHA Context Diagram"{
            include *
            autoLayout
        }

        container gotcha "gotchaContainer" "GOTCHA Container Diagram" {
            include *
            #autoLayout tb 500 500
        }

        component fws "gotchaFWS" "GOTCHA FWS Component Diagram" {
            include *
            autoLayout
        }

        component uas "gotchaUAS" "GOTCHA UAS Component Diagram" {
            include *
            #autoLayout
        }
        
        component lpr "gotchaLPR" "GOTCHA LPR Component Diagram" {
            include *
            #autoLayout
        }
        
        component tip "gotchaTIP" "GOTCHA TIP Component Diagram" {
            include *
            autoLayout
        }

        theme default

        styles {
            element "Canvas" {
                background #E4E1D1
            }

            element "Software System" {
                background #BD8B13
            }
            
            element "Container" {
                background #BD8B13
            }

            element "Mobile App" {
                shape MobileDeviceLandscape
                background #B6CCC2
            }

            element "Datastore" {
                shape Cylinder
                background #B6CCC2
            }
            
            element "Web App" {
                shape WebBrowser
                background #B6CCC2
            }

            element "API" {
                shape Robot
                background #B6CCC2
            }

            element "External Service" {
                shape Component
                background #54585A
            }

             element "Component" {
                background #B6CCC2
            }

            element "Person" {
                shape Person
                background #154734
            }

        }

        branding {
            logo "logo.png"
        }

    }

}
