({  
    closeModel: function(cmp, event, helper) {
        helper.closeModel(cmp, event, helper);
    },

    record : function(cmp, event, helper) {
        helper.record(cmp, event, helper);
    },

    submit: function(cmp, event, helper) {
        helper.submit(cmp, event, helper);
        helper.toastSuccess(cmp, event, helper);
    },

    handleSelect : function (cmp, event, helper) {
        var stepName = event.getParam("detail").value;
        cmp.set("v.value.State__c", stepName);
       }
})
