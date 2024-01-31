workspace extends ./__catalog.dsl {

    model {
        !ref zuoraOracleFusion {
            webhook = container "Webhook Integration" "Is called by Zuora on completion of a Journal Run." "AWS API Gateway" "My Software"
            function = container "Function" "Takes a Journal Run number and processes the CSV." "AWS Lambda" "My Software, Function"
            alarm = container "Alarm" "Is triggered if an error is thrown in the function." "AWS CloudWatch" "My Software, Alarm"
        }

        financeRules = element "Finance region and tax codes" "Spreadsheet" "Lists region and tax codes for every country." "File"
        oracleFusion = softwareSystem "Oracle Fusion" "Helps businesses for accounting purposes."

        accountant -> financeRules "Keeps up to date accounting rules in" "Google Sheets"
        dev -> financeRules "Uses this file to get latest region and tax codes" "Script"
        dev -> zuora "Defines finance segments in" "Dashboard"
        accountant -> zuora "Creates a new Journal Run in" "Dashboard"
        zuora -> webhook "Sends a notification on completion of a Journal Run to" "HTTP"
        webhook -> function "Triggers" "AWS"
        function -> alarm "Triggers if there is an error" "AWS"
        // alarm -> dev "Sends an email if there is an alarm to" "AWS SNS"
        function -> googleDrive "Saves the post-processed spreadsheet in" "Google Drive"
        function -> accountant "Sends an email with link to file when the post-processed summary is finished to" "Google Drive"
        accountant -> googleDrive "Accesses the post-processed spreadsheet in" "Google Drive Email"
        accountant -> oracleFusion "Makes accounting reports using" "Dashboard"
    }
    
    views {
        systemContext zuoraOracleFusion "SystemContext" {
            include *
            autoLayout
        }

        container zuoraOracleFusion "SystemContainer" {
            include *
            autoLayout
        }
    }
}
