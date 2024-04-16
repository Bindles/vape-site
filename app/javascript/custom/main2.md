### Shorthand Aliases for Common Event Listeners

# 1. on - Shorthand for Common Event Listeners
```javascript
//On Event
function on(eventType, target, callback) {
  target.addEventListener(eventType, callback);
}

// Usage with 'on'
var myElement = document.getElementById('myElementId');
on('click', myElement, function() {
  console.log('Element clicked!');
});

// Instead of:
// Using 'addEventListener' directly
var myElementStandard = document.getElementById('myElementId');
myElementStandard.addEventListener('click', function() {
  console.log('Element clicked!');
});
```

# 2. click - Shorthand for Click Event
```javascript
//Shorthand Alias for Click Event
function click(target, callback) {
  on('click', target, callback);
}


// Usage with 'click'
var myButton = document.getElementById('myButtonId');
click(myButton, function() {
  console.log('Button clicked!');
});

// Instead of:
// Using 'addEventListener' directly
var myButtonStandard = document.getElementById('myButtonId');
myButtonStandard.addEventListener('click', function() {
  console.log('Button clicked!');
});
```
# 3. load - Shorthand for Load Event
```javascript
//Shorthand Alias for Load Event
function load(callback) {
  on('load', window, callback);
}

//Example Usage Replacing Usual Code
load(function() {
  console.log('Page loaded!');
});
// Standard way
window.addEventListener('load', function() {
  console.log('Page loaded!');
});
```

# 4. Click- Shorthand for Click Event
```javascript
//Example Usage for Click Event
var myButton = document.getElementById('myButtonId');
click(myButton, function() {
  console.log('Button clicked!');
});
// Standard way
var myButtonStandard = document.getElementById('myButtonId');
myButtonStandard.addEventListener('click', function() {
  console.log('Button clicked!');
});
```
# 5. Custom - Shorthand for Custom Event
```javascript
// Example Usage for Custom Event
var customElement = document.getElementById('customElementId');
on('customEvent', customElement, function() {
  console.log('Custom event triggered on customElement');
});
// Standard way
var customElementStandard = document.getElementById('customElementId');
customElementStandard.addEventListener('customEvent', function() {
  console.log('Custom event triggered on customElement');
});