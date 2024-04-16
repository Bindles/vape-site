### Shorthand Event Listener Functions Tutorial

# 1. `on` - Shorthand for Common Event Listeners

The `on` function provides a shorthand for adding common event listeners to DOM elements. It takes three parameters: the event type, the target element, and the callback function.

**Example:**
```javascript
// Usage
var myElement = document.getElementById('myElementId');
on('click', myElement, function() {
  console.log('Element clicked!');
});
```
# 2. click - Shorthand for Click Event
The click function is a specific shorthand for adding a click event listener to a DOM element. It internally calls the on function with the event type set to 'click'.

```javascript
// Usage
var myButton = document.getElementById('myButtonId');
click(myButton, function() {
  console.log('Button clicked!');
});
```
# 3. load - Shorthand for Load Event
The load function is a shorthand for adding a load event listener to the window object. It simplifies the process of waiting for the entire page to load before executing a callback.

```javascript
// Usage
load(function() {
  console.log('Page loaded!');
});
```

# 4. Custom Event - Using on for Custom Events
You can use the on function for custom events as well. Define a custom event type and attach a callback to handle it.

Example:

```javascript
// Usage
var customElement = document.getElementById('customElementId');
on('customEvent', customElement, function() {
  console.log('Custom event triggered on customElement');
});
```
# Conclusion:
These shorthand functions provide a concise and readable way to attach event listeners to DOM elements. Whether you're handling common events like clicks or custom events, using these shorthands can enhance the clarity of your code. Remember to replace the traditional addEventListener syntax with these shorthands to make your code more succinct and maintainable.