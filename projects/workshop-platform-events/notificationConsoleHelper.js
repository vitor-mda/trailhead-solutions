({
    subscribe : function(component, helper) {
        const channel = component.get('v.channel');
        
        component.find('empApi').subscribe(channel, -1, $A.getCallback(
            function(message) {
            console.log('Event received: ' + JSON.stringify(message));
            helper.onReceiveNotification(component, message);
        })).then($A.getCallback(
            function(newSubscription) {
                console.log('Subscribed to channel ' + channel);
                component.set('v.subscription', newSubscription);
            }));
    },
    
    unsubscribe : function(component) {
        component.find('empApi').unsubscribe(component.get('v.subscription'), $A.getCallback(
            function(message) {
            console.log('Unsubscribed from channel ' + message.channel);
        }));
    },
    
    onReceiveNotification : function(component, message) {
        const newNotification = {
            time : $A.localizationService.formatDateTime(
                message.data.payload.CreatedDate, 'HH:mm'),
            message: message.data.payload.Message__c
        };
        const notifications = component.get('v.notifications');
        
        notifications.push(newNotification);
        component.set('v.notifications', notifications);
        this.displayToast(component, 'info', newNotification.message);
    },
    
	displayToast : function(component, type, message) {
        const toastEvent = $A.get('e.force:showToast');
        toastEvent.setParams({
            type: type,
            message: message
        });
        toastEvent.fire();
	}
})
