({
    closeModel: function(cmp, event, helper) {
        helper.close(cmp, event, helper);
    },

    submit: function(cmp, event, helper) {
        helper.submit(cmp, event, helper);
    },

    handleSelect : function (cmp, event, helper) {
        var stepName = event.getParam("detail").value;
        cmp.set("v.value.State__c", stepName);
       }
})
