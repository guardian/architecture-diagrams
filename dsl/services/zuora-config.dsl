workspace extends ../main/catalog.dsl {

    model {
        !ref zuoraConfig {
            function = container "Lambda Function" "TBC." "AWS Lambda"
        }

        // dev -> zuoraConfig "Uses CLI commands" "Command Line"
        function -> zuora "Imports or exports canonical config programmatically" "Script"
    }
    
    views {
        systemContext zuoraConfig "SystemContext" {
            include *
            autoLayout
        }

        container zuoraConfig "SystemContainer" {
            include *
            autoLayout
        }
    }
    
}
