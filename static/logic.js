function keyPressHandler(event) {
    var key = event.keyCode || event.which;
    var keychar = String.fromCharCode(key);
    if ("wasd".indexOf(keychar) != -1) {
        document.getElementById(keychar + "link").click();
    }
}

document.onkeypress = keyPressHandler;
