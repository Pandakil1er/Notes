
object single responsibility : 


- **Information holder** – an object designed to know certain information and provide that information to other objects.
- **Structurer** – an object that maintains relationships between objects and information about those relationships.
- **Service provider** – an object that performs specific work and offers services to others on demand.
- **Controller** – an object designed to make decisions and control a complex task.
- **Coordinator** – an object that doesn’t make many decisions but, in a rote or mechanical way, delegates work to other objects.
- **Interfacer** – an object that transforms information or requests between distinct parts of a system.

coupling
https://web.archive.org/web/20200810210808/https://medium.com/@alexcastrounis/how-to-write-highly-scalable-and-maintainable-javascript-coupling-c860787dbdd4


```js
document.addEventListener("DOMContentLoaded", function(event) {  
var orderModule = (function() {  
var orders = {},  
EST_DELIVERY = 'current estimated delivery time',  
estimatedDeliveryTime;  
  
PubSub.subscribe(EST_DELIVERY, function(msg, data) {  
console.log(msg);  
estimatedDeliveryTime = data;  
});  
  
return orders;  
})();  
  
var deliveryModule = (function() {  
var deliveries = {},  
EST_DELIVERY = 'current estimated delivery time';  
  
deliveries.getEstimatedDeliveryTime = function() {  
var estimatedDeliveryTime = 1; // Hard-coded to 1 hour, but likely an API call.  
  
PubSub.publish(EST_DELIVERY, estimatedDeliveryTime);  
};  
  
return deliveries;  
})();  
  
deliveryModule.getEstimatedDeliveryTime();  
});

```
