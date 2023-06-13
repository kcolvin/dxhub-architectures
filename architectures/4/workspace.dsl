/*
 * This is a reference architecture for the San Bernardino Snowplow challenge facilitated by the Cal Poly DxHUB
*/

workspace "San Bernardino County Snow Plow Challenge" "This is a sample architecture model of PP Software System " {
!adrs /architecture/doc/decisions/
!docs /architecture/doc/


    model {
    
        pp = softwareSystem "SBC Plow Portal" "San Bernardino Snowplow Portal" "Powered by ESRI ArcGIS Winter Weather Framework" {

            optimization = container "Optimization" "Snowplow route optimization and turn-by-turn directions"{
                networkData = component "Network Dataset" "Road network model data" "ArcGIS Professional" "Data Store"
                networkAnalyzer = component "Network Analyzer" "Solver for optimized directional routing through a network" "ArcGIS Analyzer" "Automation"
                routeLayer = component "Route Layer" "Manage route related information: Stops, Routes, Point Barriers, Line Barriers, Polygon Barriers" "ArcGIS Professional" "Data Store"
                routeDirections = component "Direction Layer" "Manage route related information" "ArcGIS Professional" "Data Store"
                navigator = component "Navigator" "Custom Snowplow Route Guidance" "ArcGIS Navigator (iOS/Android)" "Mobile App"
            }

            outreach = container "Outreach" "Winter Weather Outreach"{
                safeRoads = component "Safe Winter Roads" "Share winter weather plans, snow routes, and parking restrictions." "ArcGIS Hub Site" "Web App"
                routeStatus = component "Route Status" "Share near real-time road status during winter weather events" "Media Map App" "Web App"
                routeRestrictions = component "Snowplow Routes and Parking Status" "Share snow routes, route priorities, and parking restrictions" "Media Map App" "Web App"
                snowRequest = component "Snow Requests" "Solicit winter weather service requests from the public" "SeeClickFix" "Mobile App"
                snowRequestManager = component "Snow Request Manager" "Triage non-emergency snow and ice problems reported by the general public." "SeeClickFix" "Web App"
            }

            operations = container "Operations" "Winter Weather Operations"{
                opsCenter = component "Winter Operations Center" "Plan operations, manage authoritative content, and track operations activity throughout winter season""ArcGIS Experience Builder" "Web App"
                opsEventDashboard = component "Winter Event Dashboard" "Monitor snow response activities during operational periods" "ArcGIS Dashboards app" "Web App"                
                opsSeasonDashboard = component "Winter Season Dashboard" "Review response activities for any event throughout the winter season" "ArcGIS Dashboards App" "Web App"                
                statusReport = component "Status Reporter" "Records current vehicle location, service status, obstructions, parking violations, etc." "ArcGIS Quick Capture (iOS/Android)" "Mobile App"
                materialReport = component "Material Report" "Records materials used by each vehicle (e.g. cinder)" "ArcGIS Survey123" "Mobile App"                
            }

            management = container "Data Management" "Managed, authoritative inventory of snow routes, service areas, and other essential operation data"{
                road = component "Foundational Road Data" "Manage road related information" "ArcGIS Professional" "Data Store"
                plowRoute = component "Snowplow Route Data" "Manage route related information" "ArcGIS Professional" "Data Store"
                statusManager = component "Status Manager" "Manual route status updates" "ArcGIS Web AppBuilder" "Web App"
                telemetry = component "Snowplow Telematic Data" "Real-time snowplow geolocation and telematic data" "ArcGIS Velocity" "Data Store"
                plowFleet = component "Snowplow Fleet" "Snowplow Vehicle Data" "Excel" "Data Store"
                opsNotebook = component "Winter Weather Operations Notebook" "Automate data management and ArcGIS Velocity tasks" "ArcGIS Professional + Jupyter + Python" "Automation"
            }
        }

# External Entities
        
        # External Actors
        sbcmanagement = person "County Management" "San Bernardino County board and general management"
        opsManager = person "Operations Manager" "Public Works operations manager"
        dispatch = person "Dispatch" "Public Works snowplow dispatch operator"
        driver = person "Snowplow Driver" "Public Works snowplow driver"
        gisAdmin = person "GIS Administrator" "GIS system administrator and route analyst"
        citizen = person "Citizen" "SBC resident/property owner"
        visitor = person "Visitor" "Non-SBC resident"
        contractor = person "Independent Contractor" "Localized plowing resource for hire"
        chp = person "CHP" "Law enforcement & towing"
        ems = person "EMS" "Emergency Management Services"    
        
        # External Services
        cart = softwareSystem "Cartegraph" "Work management information system" "External Service"
        fts = softwareSystem "Forward Thinking: Intellihub" "Snowplow telematics provider" "External Service"
        scf = softwareSystem "See-Click-Fix" "Citizen issue logging" "External Service"
        aad = softwareSystem "Azure Active Directory" "Authentication and authorization security service" "External Service"
        nws = softwareSystem "Weather Data" "Data from the National Weather Service" "External Service"
        clm = softwareSystem "Cyclomedia" "Reality capture data of road and infrastructure assets" "External Service"
        map = softwareSystem "Waze" "Authoritative traffic and road condition data" "External Service"
        
# External Relations

        #External Actors
        opsSeasonDashboard -> sbcManagement "Winter operations performance data"
        opsEventDashboard -> sbcManagement "Winter operations performance data"
        dispatch -> snowRequestManager "Manages winter weather request queue"
        opsCenter -> opsManager "Single pane of glass into winter operations"
        driver -> statusReport "Route updates "
        driver -> materialReport "Material usage"
        driver -> routeLayer "Advise on feature creation"
        navigator -> driver "Turn-by-turn directions for assigned route"
        gisAdmin -> opsNotebook "Manage automation tasks"
        gisAdmin -> plowFleet "Load snowplow fleet data"
        gisAdmin -> statusManager "Load manually reported route status"
        gisAdmin -> routeLayer "Create route features"
        gisAdmin -> networkAnalyzer "Execute network analyzer to populate direction layer"
        opsCenter -> CHP "Parking violations"
        ems -> snowRequestManager "Emergency snow clearing requests"
        routeStatus -> EMS "Real time route status"
        safeRoads -> visitor "Road status and safety information"
        safeRoads -> citizen "Road status and safety information"
        citizen -> snowRequest "Winter event requests"
        snowRequestManager -> contractor "Snow clearing requests"

        #External Systems
        aad -> management "User authentication and authorization"
        fts -> telemetry  "Snowplow location and telemetry data"
        snowRequest -> scf "Snow clearing request from public"
        scf -> snowRequestManager "Triaged request status"
        nws -> opsCenter "Current weather and forecast"
        map -> networkAnalyzer "Traffic and incident data"
        opsCenter -> cart "Work management data"
        clm -> opsCenter "Reality capture data"

#Internal Relations

        #Operations
        materialReport -> opsCenter "Material data"
        statusReport -> opsCenter "Route status data"
        opscenter -> opsSeasonDashboard "Aggregated seasonal data"
        opscenter -> opsEventDashboard "Integrated event data"
        management -> opsCenter "Route and telemetry data"
        opsCenter -> plowRoute "Route status and material data"
        
        #Outreach
        routeStatus -> safeRoads "Generalized route status data"
        routeRestrictions -> safeRoads "Route data and parking restrictions"
        snowRequestManager -> opsCenter "Prioritized snow clearing requests"
        management -> routeStatus "Route status data"
        management -> routeRestrictions "Route definitions and restrictions"
        snowRequestManager -> safeRoads "Sanitized request data"

        #Optimization
        networkData -> routeLayer "Network definition"
        routeLayer -> networkAnalyzer "Network and features definitions"
        networkAnalyzer -> routeDirections "Optimized route"
        routeDirections -> navigator "Turn-by-turn directions"
        management -> networkData "Road network"
        management -> routeLayer "Route definiition"
        routeDirections -> management "Direction data"

        #Management
        plowFleet -> opsNotebook "Snowplow vehicle data"
        opsNotebook -> plowFleet "Enriched data"
        telemetry -> opsNotebook "Snowplow streaming location data"
        opsNotebook -> telemetry "Enriched data"
        plowRoute -> opsNotebook "Route definition"
        opsNotebook -> plowRoute "Enriched data"
        road -> opsNotebook "Road network"
        opsNotebook -> road "Enriched data"
        statusManager -> plowRoute "Route status data"
        optimization -> plowRoute   "Updated route and direction layers"
    }

        views {
            
        systemContext pp "Context" "PlowPortal Context Diagram"{
            include *
            # autoLayout
        }

        container pp "Container" "PlowPortal Container Diagram" {
            include *
            # autoLayout
        }

        component outreach "Outreach" "PlowPortal Outreach Component Diagram" {
            include *
            # autoLayout
        }

        component operations "Operations" "PlowPortal Operations Component Diagram" {
            include *
            # autoLayout
        }
        
        component optimization "Optimization" "PlowPortal Optimization Component Diagram" {
            include *
            # autoLayout
        }
        
        component management "Management" "PlowPortal Management Component Diagram" {
            include *
            # autoLayout
        }

        theme default

        styles {
            element "Canvas" {
                background #E4E1D1
                color #ffffff
            }

            element "Software System" {
                background #BD8B13
                color #ffffff
            }
            
            element "Container" {
                background #BD8B13
                color #ffffff
            }

            element "External Service" {
                shape Component
                background #54585A
                color #ffffff
            }

            element "Person" {
                shape Person
                background #154734
                color #ffffff
            }
            
            element "Component" {
                shape Component
                background #B6CCC2
                color #ffffff
            }

            element "Mobile App" {
                shape MobileDeviceLandscape
                background #B6CCC2
                color #ffffff
            }
            
            element "Desktop App" {
                shape Window
                background #B6CCC2
                color #ffffff
            }
            
            element "Web App" {
                shape WebBrowser
                background #B6CCC2
                color #ffffff
            }

            element "Data Store" {
                shape Cylinder
                background #B6CCC2
                color #ffffff
            }
            
            element "Automation" {
                shape Robot
                background #B6CCC2
                color #ffffff
            }
        }

        branding {
            logo "logo.png"
        }

    }

}
