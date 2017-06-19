var blocmetrics = {};
  blocmetrics.report = function(eventName) {
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    
    request.open("POST", "https://metrics-tracker-babydontsaythat.c9users.io/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  
  };