workspace extends ../main/catalog.dsl {

    model {
        !ref holidayStopProcessor {
            function = container "Lambda Function" "TBC." "AWS Lambda"
        }

        function -> salesforce "Reads holiday stop requests and writes back details of the amendments after updating Zuora" "Salesforce Api"
        function -> zuora "Adds the appropriate rate plan to the subscription on the first day of the next billing period in" "Zuora Api"
    }

    views {
         systemContext holidayStopProcessor "SystemContext" {
            include *
            autoLayout
        }

        container holidayStopProcessor "SystemContainer" {
            include *
            autoLayout
        }
    }
    
}
