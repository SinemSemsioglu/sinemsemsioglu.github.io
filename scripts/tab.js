//$( "#foo" ).toggleClass( className, addOrRemove );

// tab selection is made from the div .tab-selection and each .selection elements corresponds to a tab
// each .selection element also has a class .tab-X, and there is a corresponding content div with the
// same class and .tab-content.
// so each time a .selection div is clicked, we want to activate the corresponding content div and make
// the others visible

// for all content divs, attach the toogleClass function with a function that checks whether their tab
// is active or not


// find the first active tab by looking whether any one of the selections contain the .tab-active class
// or set the first one as active, if multiple selection divs contain.tab-active the last one is set


$( document ).ready(function() {
    var activeTab = "";

    $(".selection").toArray().forEach(function(element) {
        if ($(element).hasClass("tab-active")){
            activeTab = getTabName(element);
        } 
    })
    
    if (activeTab == "") {
        activeTab = getTabName($("selection")[0]);
    }
    
    setClasses();
    
    $(".selection").click( function() {
        activeTab = getTabName(this);
        setClasses();
    });
    
    function getTabName(element){
        var classList = element.className.split(' ');
        var tabName = classList.find(function(element){
            return element.startsWith("tab-name-");
        });
        return tabName;
    }
    
    function setClasses() {
        $(".selection").toArray().forEach(setActiveClass);
        $('.tab-content').toArray().forEach(setActiveClass);
    }

    function setActiveClass(element) {
        var jqElm = $(element);
        if (jqElm.hasClass(activeTab))
            jqElm.addClass("tab-active");
        else {
            jqElm.removeClass("tab-active");
        }
    }
});
