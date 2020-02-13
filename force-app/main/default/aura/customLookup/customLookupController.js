({
    search : function(cmp, event, helper) {
        cmp.set("v.search", cmp.find('search').get('v.value'));
        var action = cmp.get('c.lookupField')
        action.setParams({
            "ObjectName": cmp.get("v.ObjectName"),
            "search" : cmp.get("v.search"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var recordResult = response.getReturnValue();
                cmp.set("v.records",recordResult);
            } 
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

    searchChoose : function(cmp, event, helper){
        cmp.set("v.value", event.currentTarget.dataset.record);
        var action = cmp.get('c.setName');
        action.setParams({
            "id" : cmp.get("v.value"),
            "ObjectName": cmp.get("v.ObjectName"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var recordResult = response.getReturnValue();
                cmp.set("v.name",recordResult.Name);
            } 
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

    removeSelectedOption : function(cmp, event, helper){
        cmp.set("v.value", '');
    }
})
