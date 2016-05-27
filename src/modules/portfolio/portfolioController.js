angular.module("personalWeb").controller("portfolioController",
    [
        function () {

            this.proccessingPath = "templates/processing/processing.html";

            this.portfolioOptions = ["shm", "waves", "rotation", "shatter"]; //TODO birds

            this.selectedSource = "shatter.pde";

            this.selectSketch = function (name){
                this.selectedSource = "assets/processing/"+ name + "/" + name + ".pde";
            }
        }]);