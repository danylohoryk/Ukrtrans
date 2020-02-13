({
    close: function(cmp, event, helper) {
        cmp.set("v.isOpen", false);
    },

    submit: function(cmp, event, helper) {
        var action = cmp.get("c.TransportationCreate");
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
