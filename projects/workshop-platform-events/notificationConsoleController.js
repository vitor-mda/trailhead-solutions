({
	onInit : function(component, event, helper) {
        component.set('v.subscriptions', null);
        component.set('v.notifications', []);
        
        component.find('empApi').onError($A.getCallback(
            function(message) {
                console.error('Received error ', JSON.stringify(message));
            }));
        helper.subscribe(component, helper);
        helper.displayToast(component, 'success', 'Ready to receive notifications.');
	},
    
    onClear : function(component, event, helper) {
        component.set('v.notifications', []);
    },
    
    onToggleMute : function(component, event, helper) {
        const muted = !component.get('v.isMuted');
        
        component.set('v.isMuted', muted);
        if (muted) {
            helper.unsubscribe(component);
        } else {
            helper.subscribe(component, helper);
        }
        helper.displayToast(component, 'success', 'Notifications ' + (muted ? 'muted.' : 'unmuted.'));
    }
})
