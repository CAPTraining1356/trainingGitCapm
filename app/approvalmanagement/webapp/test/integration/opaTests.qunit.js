sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'approvalmanagement/test/integration/FirstJourney',
		'approvalmanagement/test/integration/pages/ApprovalsList',
		'approvalmanagement/test/integration/pages/ApprovalsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ApprovalsList, ApprovalsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('approvalmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheApprovalsList: ApprovalsList,
					onTheApprovalsObjectPage: ApprovalsObjectPage
                }
            },
            opaJourney.run
        );
    }
);