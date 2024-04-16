// Shorthand alias for common event listeners
function on(eventType, target, callback) {
  target.addEventListener(eventType, callback);
}

// Shorthand alias for click event
function click(target, callback) {
  on('click', target, callback);
}

// Shorthand alias for load event
function load(callback) {
  on('load', window, callback);
}

// Example usage replacing usual code
load(function() {
  console.log('Page loaded!');
});
// Standard way
window.addEventListener('load', function() {
  console.log('Page loaded!');
});

// Example usage for click event
var myButton = document.getElementById('myButtonId');
click(myButton, function() {
  console.log('Button clicked!');
});
// Standard way
var myButtonStandard = document.getElementById('myButtonId');
myButtonStandard.addEventListener('click', function() {
  console.log('Button clicked!');
});

// Example usage for custom event
var customElement = document.getElementById('customElementId');
on('customEvent', customElement, function() {
  console.log('Custom event triggered on customElement');
});
// Standard way
var customElementStandard = document.getElementById('customElementId');
customElementStandard.addEventListener('customEvent', function() {
  console.log('Custom event triggered on customElement');
});
