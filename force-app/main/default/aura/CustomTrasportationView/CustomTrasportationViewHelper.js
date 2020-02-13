({
    openModel: function(cmp, event, helper) {
        cmp.set("v.isOpen", true);
    },

    openUpdate: function(cmp, event, helper) {
        let idOfRecord = event.currentTarget.dataset.record;
        cmp.set("v.TransportationId", idOfRecord);
        cmp.set("v.isOpenUpdate", true);
        $A.createComponent(
            "c:CustomTransportaionUpdate",
            {
                "recordId": idOfRecord,
                "isOpen": cmp.get("v.isOpenUpdate"),
            },
            function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newButton);
                    cmp.set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
    },

    doInit : function(cmp, event, helper) {
        // call apex method to fetch list view dynamically 
        var action = cmp.get("c.listValues");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var listViewResult = response.getReturnValue();
                if(listViewResult.length > 0){
                    // set listViewResult attribute with response
                    cmp.set("v.listViewResult", listViewResult);  
                }            } 
            else if (state === "INCOMPLETE") {
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
    }
})
