  //LOG
  var l=console.log.bind(console)

    // OLD | Add a custom alias for document.getElementById
  // gei = function(id) {
  //   return document.getElementById(id);
  // };


  // Add custom aliases for various document methods
  document.ge = {
    id: function (id) {
      return document.getElementById(id);
    },
    qs: function (selector) {
      return document.querySelector(selector);
    },
    qsa: function (selector) {
      return document.querySelectorAll(selector);
    },
    ce: function (tagName) {
      return document.createElement(tagName);
    },
    cn: function (className) {
      return document.getElementsByClassName(className);
    },
    tn: function (tagName) {
      return document.getElementsByTagName(tagName);
    },
  };

  // Now you can use the aliases
  var element = document.ge.id("yourElementId");
  element.innerHTML = "Hello, using ge.id!";

  var selectedElement = document.ge.qs(".someClass");
  l(selectedElement);

  var allElements = document.ge.qsa(".someClass");
  l(allElements);

  var newElement = document.ge.ce("div");
  newElement.innerHTML = "New Element";
  document.body.appendChild(newElement);

  var elementsByClass = document.ge.cn("someClass");
  l(elementsByClass);

  var elementsByTagName = document.ge.tn("div");
  l(elementsByTagName);

  //OLD Now you can use document.gei instead of document.getElementById
  // var element = gei("yourElementId");
  // element.innerHTML = "Hello, Custom Alias!";
