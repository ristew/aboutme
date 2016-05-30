var selkeys = [];
function findUsedselkeys() {
    var allElems = document.getElementsByTagName("*");
    for (var i = 0; i < allElems.length; ++i) {
        var elem = allElems[i];
        var selidx;
        var sel = "selector-";
        if ((selidx = elem.className.indexOf(sel)) == -1) {
            continue;
        }
        var key = elem.className[selidx + sel.length];
        selkeys.push(key);
    }
}

function keyPressHandler(event) {
    var key = event.keyCode || event.which;
    var keychar = String.fromCharCode(key);
    if (selkeys.indexOf(keychar) != -1) {
        var elems = document.getElementsByClassName("selector-" + keychar);
        for (i = 0; i < elems.length; ++i) {
            elems[i].click();
        }
    }
}

window.onload = function (e) {
    document.onkeypress = keyPressHandler;
    findUsedselkeys();
}
