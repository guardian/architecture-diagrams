workspace extends ../main/catalog.dsl {

    model {
        !ref paymentApi {
            webServer = container "Web Server" "TBC" "Scala Play"
        }

        reader -> webServer "Makes a single contribution via" "HTTPS"
    }
    
    views {
         systemContext paymentApi "SystemContext" {
            include *
            autoLayout
        }

         container paymentApi "SystemContainer" {
            include *
            autoLayout
        }
    }
    
}
