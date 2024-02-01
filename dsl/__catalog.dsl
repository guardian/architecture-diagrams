workspace {

    !identifiers hierarchical
    
    model {
        // People
        reader = person "Guardian Reader" "A reader of the Guardian."
        dev = person "Guardian Developer" "A software developer within the Guardian."
        accountant = person "Guardian Accountant" "An accountant within the Guardian."
        csr = person "Guardian CSR" "A Customer Service Representative within the Guardian."

        // SaaS
        salesforce = softwareSystem "Salesforce" "Stores customers subscriptions, contributions and accounts details." "Database, SaaS"
        zuora = softwareSystem "Zuora" "Stores customers transactions and subscriptions." "Database, SaaS"
        googleDrive = softwareSystem "Google Drive" "Stores the post-processed spreadsheets securely." "Database, SaaS"

        // Supporter Revenue
        zuoraOracleFusion = softwareSystem "Zuora Oracle Fusion" "Processes the exported Zuora Journal Run to make it compatible with Oracle Fusion." "My Software"
        zuoraConfig = softwareSystem "Zuora Config" "Holds the configuration for Zuora components and allows import and export." "My Software"
        singleContributionSalesforceWrites = softwareSystem "Single Contribution Salesforce Writes" "Processes single contributions made via payment-api and creates records in Salesforce."
        paymentApi = softwareSystem "Payment Api" "Handles single contribution payments."
        supportWorkers = softwareSystem "Support Workers" "Handles subscription payments."
        holidayStopProcessor = softwareSystem "Holiday Stop Processor" "Updates subscriptions in Zuora with holiday stop amendments."

        // Relationships
        reader -> csr "Asks questions to" "Telehpone / Chat"
    }

    views {
        styles {
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }

            element "Database" {
                shape Cylinder
            }

            element "Queue" {
                shape Pipe
            }

            element "File" {
                shape Folder
            }

            element "SaaS" {
                background #7C7C7C
                color #ffffff
            }

        }
    }

}
