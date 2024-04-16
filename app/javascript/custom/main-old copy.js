  //LOG
  var l=console.log.bind(console)

    // OLD | Add a custom alias for document.getElementById
  document.gei = function(id) {
    return document.getElementById(id);
  };

  // Now you can use document.gei instead of document.getElementById
  var element = gei("yourElementId");
  element.innerHTML = "Hello, Custom Alias!";
