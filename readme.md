# C4 Model Architecture Diagrams Of The Guardian

In this experiment, the goal is to use the Strcturizr DSL language to create C4 model as code for the whole P&E department.

If you would like to take part, please get in touch.

With PlantUML:

![landscape](images/landscape.svg)

With Mermaid:

```mermaid
graph TB
  linkStyle default fill:#ffffff

  subgraph diagram ["System Landscape"]
    style diagram fill:#ffffff,stroke:#ffffff

    1["<div style='font-weight: bold'>Guardian Reader</div><div style='font-size: 70%; margin-top: 0px'>[Person]</div><div style='font-size: 80%; margin-top:10px'>A reader of the Guardian.</div>"]
    style 1 fill:#08427b,stroke:#052e56,color:#ffffff
    10["<div style='font-weight: bold'>Single Contribution Salesforce Writes</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Processes single<br />contributions made via<br />payment-api and creates<br />records in Salesforce.</div>"]
    style 10 fill:#dddddd,stroke:#9a9a9a,color:#000000
    11["<div style='font-weight: bold'>Payment Api</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Handles single contribution<br />payments.</div>"]
    style 11 fill:#dddddd,stroke:#9a9a9a,color:#000000
    12["<div style='font-weight: bold'>Support Workers</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Handles subscription<br />payments.</div>"]
    style 12 fill:#dddddd,stroke:#9a9a9a,color:#000000
    13["<div style='font-weight: bold'>Holiday Stop Processor</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Updates subscriptions in<br />Zuora with holiday stop<br />amendments.</div>"]
    style 13 fill:#dddddd,stroke:#9a9a9a,color:#000000
    2["<div style='font-weight: bold'>Guardian Developer</div><div style='font-size: 70%; margin-top: 0px'>[Person]</div><div style='font-size: 80%; margin-top:10px'>A software developer within<br />the Guardian.</div>"]
    style 2 fill:#08427b,stroke:#052e56,color:#ffffff
    3["<div style='font-weight: bold'>Guardian Accountant</div><div style='font-size: 70%; margin-top: 0px'>[Person]</div><div style='font-size: 80%; margin-top:10px'>An accountant within the<br />Guardian.</div>"]
    style 3 fill:#08427b,stroke:#052e56,color:#ffffff
    4["<div style='font-weight: bold'>Guardian CSR</div><div style='font-size: 70%; margin-top: 0px'>[Person]</div><div style='font-size: 80%; margin-top:10px'>A Customer Service<br />Representative within the<br />Guardian.</div>"]
    style 4 fill:#08427b,stroke:#052e56,color:#ffffff
    5[("<div style='font-weight: bold'>Zuora</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Stores customers transactions<br />and subscriptions.</div>")]
    style 5 fill:#7c7c7c,stroke:#565656,color:#ffffff
    6[("<div style='font-weight: bold'>Salesforce</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Stores customers<br />subscriptions, contributions<br />and accounts details.</div>")]
    style 6 fill:#7c7c7c,stroke:#565656,color:#ffffff
    7[("<div style='font-weight: bold'>Google Drive</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Stores the post-processed<br />spreadsheets securely.</div>")]
    style 7 fill:#7c7c7c,stroke:#565656,color:#ffffff
    8["<div style='font-weight: bold'>Zuora Oracle Fusion</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Processes the exported Zuora<br />Journal Run to make it<br />compatible with Oracle<br />Fusion.</div>"]
    style 8 fill:#dddddd,stroke:#9a9a9a,color:#000000
    9["<div style='font-weight: bold'>Zuora Config</div><div style='font-size: 70%; margin-top: 0px'>[Software System]</div><div style='font-size: 80%; margin-top:10px'>Holds the configuration for<br />Zuora components and allows<br />import and export.</div>"]
    style 9 fill:#dddddd,stroke:#9a9a9a,color:#000000

    1-. "<div>Asks questions to</div><div style='font-size: 70%'>[Telehpone / Chat]</div>" .->4
    3-. "<div>Accesses the post-processed<br />spreadsheet in</div><div style='font-size: 70%'></div>" .->7
    8-. "<div>Sends an email if there is an<br />alarm to</div><div style='font-size: 70%'></div>" .->2
    8-. "<div>Saves the post-processed<br />spreadsheet in</div><div style='font-size: 70%'></div>" .->7
    8-. "<div>Sends an email with link to<br />file when the post-processed<br />summary is finished to</div><div style='font-size: 70%'></div>" .->3
    5-. "<div>Sends a notification on<br />completion of a Journal Run<br />to</div><div style='font-size: 70%'></div>" .->8
    2-. "<div>Defines finance segments in</div><div style='font-size: 70%'></div>" .->5
    3-. "<div>Creates a new Journal Run in</div><div style='font-size: 70%'></div>" .->5
    2-. "<div>Uses CLI commands</div><div style='font-size: 70%'></div>" .->9
    9-. "<div>Imports or exports canonical<br />config programmatically</div><div style='font-size: 70%'></div>" .->5
    10-. "<div>Notifies failures to</div><div style='font-size: 70%'></div>" .->2
    10-. "<div>Creates single contribution<br />records in</div><div style='font-size: 70%'></div>" .->6
    11-. "<div>Sends acquisition events to</div><div style='font-size: 70%'></div>" .->10
    2-. "<div>Debugs failed messages in</div><div style='font-size: 70%'></div>" .->10
    4-. "<div>Manages single contributions<br />using</div><div style='font-size: 70%'></div>" .->6
    1-. "<div>Makes a single contribution<br />via</div><div style='font-size: 70%'></div>" .->11
    12-. "<div>Sends thank you email to</div><div style='font-size: 70%'></div>" .->1
    12-. "<div>Creates Zuora subscription in</div><div style='font-size: 70%'></div>" .->5
    12-. "<div>Creates Salesforce contact in</div><div style='font-size: 70%'></div>" .->6
    1-. "<div>Subscribes via</div><div style='font-size: 70%'></div>" .->12
    13-. "<div>Adds the appropriate rate<br />plan to the subscription on<br />the first day of the next<br />billing period in</div><div style='font-size: 70%'></div>" .->5
    13-. "<div>Reads holiday stop requests<br />and writes back details of<br />the amendments after updating<br />Zuora</div><div style='font-size: 70%'></div>" .->6
  end
```
