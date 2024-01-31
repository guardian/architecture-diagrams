workspace extends ../main/catalog.dsl {

    model {
        !ref paymentApi {
            // To be completed
        }

        reader -> paymentApi "Makes a single contribution via" "HTTPS"
    }
    
    views {
         systemContext paymentApi "SystemContext" {
            include *
            autoLayout
        }
    }
    
}
