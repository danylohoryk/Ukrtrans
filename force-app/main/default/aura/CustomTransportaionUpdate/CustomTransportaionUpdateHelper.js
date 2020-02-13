({
    closeModel: function(cmp, event, helper) {
        cmp.set("v.isOpen", false);
    },

    toastSuccess : function(cmp, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        console.log("success")
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been updated successfully."
        });
        toastEvent.fire();
    },

    record : function(cmp, event, helper) {
        // call apex method to fetch list view dynamically 
        var action = cmp.get("c.getRecord");
        action.setParams({
            "recordId": cmp.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var recordResult = response.getReturnValue();
                // set listViewResult attribute with response
                cmp.set("v.value",recordResult);                } 
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
    },

    submit: function(cmp, event, helper) {
        var action = cmp.get("c.updateRecord");
        action.setParams({
            "value": cmp.get("v.value")
        });
        action.setCallback(this, function(response) {
                        var state = response.getState();
                        if (cmp.isValid() && state === "SUCCESS") {
                            var rec = response.getReturnValue();
                            console.log(rec);
                        }
                    });
        cmp.set("v.isOpen", false);
        $A.enqueueAction(action);
        location.reload(true);
    },
})
