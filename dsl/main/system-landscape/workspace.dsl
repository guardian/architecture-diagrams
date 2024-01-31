workspace extends ../catalog.dsl {

    !plugin FindRelationshipsPlugin {
        filename ../../services/zuora-oracle-fusion.dsl
    }

    !plugin FindRelationshipsPlugin {
        filename ../../services/zuora-config.dsl
    }

    !plugin FindRelationshipsPlugin {
        filename ../../services/single-contribution-salesforce-writes.dsl
    }

    !plugin FindRelationshipsPlugin {
        filename ../../services/payment-api.dsl
    }

     !plugin FindRelationshipsPlugin {
        filename ../../services/support-workers.dsl
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
    }

}
