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
  var element = document.ge.id("yourElementId");