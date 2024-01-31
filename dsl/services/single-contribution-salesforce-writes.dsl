workspace extends ../main/catalog.dsl {

    model { 
        !ref singleContributionSalesforceWrites {
            eventBusRule = container "Acquisition Bus Rule" "Filters events with source starting with 'payment-api'."
            sqsQueue = container "SQS Queue" "Stores 'payment-api' messages" "Queue"
            deadLetterQueue = container "Dead Letter Queue" "Stores messages that haven't been processed successfully" "Queue"
            lambdaFunction = container "Lambda Function" "Processes the message and creates a single contribution record in Salesforce."
            cloudWatchAlarm = container "CloudWatch Alarm" "Listens to the metric of at least one message present in the DLQ"
        }

        csr -> salesforce "Manages single contributions using" "Salesforce Console"
        dev -> deadLetterQueue "Debugs failed messages in" "AWS Console"
        cloudWatchAlarm -> dev "Notifies failures to" "Email"
        paymentApi -> singleContributionSalesforceWrites "Sends acquisition events to" "AWS Event Bridge"
        singleContributionSalesforceWrites -> salesforce "Creates single contribution records in" "JSON / HTTP"
        paymentApi -> eventBusRule "Sends acquisition events to" "AWS Event Bridge"
        lambdaFunction -> salesforce "Creates single contribution records in" "JSON / HTTP"
        eventBusRule -> sqsQueue "Sends 'payment-api' messages to" "JSON / HTTP"
        sqsQueue -> lambdaFunction "Sends events to" "Polling"
        deadLetterQueue -> sqsQueue "Redrives messages into" "JSON / HTTP"
        lambdaFunction -> deadLetterQueue "Sends messages that haven't been processed correctly to" "JSON / HTTP"
        deadLetterQueue -> cloudWatchAlarm "Triggers" "CloudWatch Metric"
    }

    views {
        systemContext singleContributionSalesforceWrites "SystemContext" {
            include *
            autoLayout
        }
        
        container singleContributionSalesforceWrites "SystemContainer" {
            include *
            autoLayout
        }
    }
    
}
