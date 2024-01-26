workspace extends ../main/catalog.dsl {

    model {
        dev -> zuoraConfig "Uses CLI commands." "Command Line"
        zuoraConfig -> zuora "Updates Zuora programmatically." "Script"
        zuoraConfig -> zuora "Pulls latest from Zuora to update its own canonical config." "Script"
    }
    
    views {
         systemContext zuoraConfig "SystemContext" {
            include *
            autoLayout
        }
    }
    
}
