workspace extends ./__catalog.dsl {

    !plugin FindRelationshipsPlugin {
        filename ./zuora-oracle-fusion.dsl
    }

    !plugin FindRelationshipsPlugin {
        filename ./zuora-config.dsl
    }

    !plugin FindRelationshipsPlugin {
        filename ./single-contribution-salesforce-writes.dsl
    }

    !plugin FindRelationshipsPlugin {
        filename ./payment-api.dsl
    }

    !plugin FindRelationshipsPlugin {
        filename ./support-workers.dsl
    }

    !plugin FindRelationshipsPlugin {
        filename ./holiday-stop-processor.dsl
    }
    
    views {
        systemLandscape "SystemLandscape" {
            include *
            autolayout
        }

        systemContext zuora "SystemContextZuora" {
            include *
            autoLayout
        }

        systemContext salesforce "SystemContextSalesforce" {
            include *
            autoLayout
        }
    }

}
