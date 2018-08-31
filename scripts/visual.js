resolveSketchName();

window.onload = function () {
   setPortfolioItemClickEvents();
}
    
function makeOverlayVisible() {
    overlayElement = document.getElementById("overlay");
    overlayElement.style.display = "block";

    setClickEvent(overlayElement, function() {
        //reloadPageWithHash("");
        resetOverlay();
        overlayElement.style.display = "none";
    })
}


function setPortfolioItemClickEvents() {
    var processingElement = document.getElementsByClassName("processing")[0];
    var processingItems = processingElement.getElementsByClassName("portfolio-item");

    var processingVideoItems = processingElement.getElementsByClassName("portfolio-video-item");

    var handmadeElement = document.getElementsByClassName("handmade")[0];
    var handmadeItems = handmadeElement.getElementsByClassName("portfolio-item");

    Array.prototype.forEach.call(processingVideoItems, function (item) {
        setClickEvent(item, function (event) {
            event.stopPropagation();
            makeOverlayVisible();
            setOverlayVideoItem(item.id);
        });
    });
    
    Array.prototype.forEach.call(processingItems, function (item) {
        setClickEvent(item, function (event) {
            event.stopPropagation();
            reloadPageWithHash(item.id);
        });
    });

    Array.prototype.forEach.call(handmadeItems, function (item) {
        setClickEvent(item, function (event) {
            event.stopPropagation();
            makeOverlayVisible();
            setOverlayHandmadeItem(item.getElementsByTagName("img")[0].src);
        });
    });
}

function resetOverlay (){
    var overlayImageItem = document.getElementsByClassName("overlay-image")[0];
    overlayImageItem.style.display = "none";
    var overlayVideoItem = document.getElementsByClassName("overlay-video")[0];
    overlayVideoItem.style.display = "none";
}

function setOverlayHandmadeItem(src) {
    var overlayItem = document.getElementsByClassName("overlay-image")[0];
    overlayItem.style.display = "block";
    overlayItem.src = src;

    setClickEvent(overlayItem, function(event) {
        event.stopPropagation();
    })
}


function setOverlayVideoItem(id) {
    var overlayItem = document.getElementsByClassName("overlay-video")[0];
    overlayItem.style.display = "block";
    overlayItem.src = "./assets/video/" + id + ".mp4";

    setClickEvent(overlayItem, function(event) {
        event.stopPropagation();
    })
}

function setOverlayProcessingItem(id) {
    var overlayItem = document.getElementsByClassName("overlay-sketch")[0];
    overlayItem.dataset["processingSources"] = "./" + id + ".pde";

    setClickEvent(overlayItem, function(event) {
        event.stopPropagation();
    })
}

function setClickEvent(element, func) {
    element.addEventListener("click", func);
}

function resolveSketchName() {
    var location = window.location;
    var hash = location.hash;
    var sketchName = hash.slice(2);
    if (sketchName) {
        setOverlayProcessingItem(sketchName);
        sketchOnDisplay();
    } else {
        noSketchOnDisplay();
    }
}

function reloadPageWithHash(name) {
    var location = window.location;
    location.replace("#/" + name);
    location.reload();
}

function sketchOnDisplay() {
    makeOverlayVisible();
}

function noSketchOnDisplay() {
    //?
}


    /*
    
    
    var sketchElement, placeholderElement, containerElement, nameElement, infoElement;

    getElementsSetEvents();
    resolveSketchName();


    function resolveSketchName() {
        var location = window.location;
        var hash = location.hash;
        var sketchName = hash.slice(2);
        if (sketchName) {
            setSource(sketchName);
            if (sketchName === "shatter") {
               // setTimeout(function () {
                var shatterInfoElement = document.getElementById("shatter-info");
                    shatterInfoElement.style.display = "block";
                //}, 10);
            }
            sketchOnDisplay();
        } else {
            noSketchOnDisplay();
        }
    }

    function setGeneralEvents() {
        setClickEvent(containerElement, function () {
            reloadPageWithHash("");
        });

        setClickEvent(sketchElement, function (event) {
            event.stopPropagation();
        });

        setClickEvent(nameElement, function (event) {
            event.stopPropagation();
            window.location = "/";
        });
    }

    function setSketchEvents() {
        var sketchNames = ["waves", "shm", "rotation", "mover", "shatter"];

        sketchNames.forEach(function (name) {
            var element = document.getElementById(name);
            setClickEvent(element, function (event) {
                event.stopPropagation();
                reloadPageWithHash(name);
            });
        });
    }

   

    function getElementsSetEvents() {
        sketchElement = document.getElementById("sketch");
        placeholderElement = document.getElementById("placeholder");
        containerElement = document.getElementById("main-container");
        nameElement = document.getElementById("name");
        infoElement = document.getElementById("sketch-explanation");

        setGeneralEvents();
        setSketchEvents();
    }

    function sketchOnDisplay() {
        placeholderElement.style.display = "none";
        sketchElement.style.display = "block";
        infoElement.style.display = "block";
    }

    function noSketchOnDisplay() {
        placeholderElement.style.display = "block";
        sketchElement.style.display = "none";
        infoElement.style.display = "none";
    }

    
    

    */