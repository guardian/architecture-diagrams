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
