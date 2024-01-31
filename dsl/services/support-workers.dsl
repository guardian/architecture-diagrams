workspace extends ../main/catalog.dsl {

    model {
        !ref supportWorkers {
            stateMachine = container "State Machine" "Manages the integration." "AWS Step Functions"
        }

        reader -> stateMachine "Subscribes via" "HTTPS"
        stateMachine -> salesforce "Creates Salesforce contact in" "Salesforce Api"
        stateMachine -> zuora "Creates Zuora subscription in" "Zuora Api"
    }
    
    views {
         systemContext supportWorkers "SystemContext" {
            include *
            autoLayout
        }

        container supportWorkers "SystemContainer" {
            include *
            autoLayout
        }
    }
    
}
