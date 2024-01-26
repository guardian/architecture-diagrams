workspace {

    !identifiers hierarchical
    
    model {
        reader = person "Guardian Reader" "A reader of theguardian.com."
        dev = person "Guardian Developer" "A software developer within the Guardian."
        accountant = person "Guardian Accountant" "An accountant within the Guardian."
        csr = person "Guardian Customer Service Representative" "A customer Service Representative within the Guardian."

        zuora = softwareSystem "Zuora" "Stores customers transactions and subscriptions." "Database"
        salesforceCrm = softwareSystem "Salesforce CRM" "Stores customers subscriptions, contributions and accounts details." "Database"
        googleDrive = softwareSystem "Google Drive" "Stores the post-processed spreadsheets securely." "Database"
        zuoraOracleFusion = softwareSystem "Zuora Oracle Fusion" "Processes the exported Zuora Journal Run to make it compatible with Oracle Fusion." "My Software"
        zuoraConfig = softwareSystem "Zuora Config" "Holds the configuration for Zuora components and allows import and export." "My Software"
        singleContributionSalesforceWrites = softwareSystem "Single Contribution Salesforce Writes" "Processes single contributions made via payment-api and creates records in Salesforce."
        paymentApi = softwareSystem "Payment API" "Handles single contribution payments."

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
        }
    }

}
