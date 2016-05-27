angular.module("personalWeb").controller("homeController",
    [
        function () {

            var personalText = "I studied Mathematics and Computer Science at Oberlin College," +
                " OH, USA. Upon graduation I returned to Istanbul and I am  currently" +
                " working at Monitise MEA, as a front end developer. I have been working " +
                "on the mobile website of Pegasus Airlines. I also worked on the website " +
                "of Zubizu for a little while. ";

            this.text = {
                navItems: {
                    portfolio: "Portfolio",
                    resume: "Resume"
                },
                temp: {
                    temporary: "TEMPORARY",
                    website: "WEBSITE"
                },
                about: [personalText],
                name: {
                    first: "Sinem",
                    last: "Semsioglu"
                }
            };

            this.openCv = function () {
                console.log("ksjd");
               window.open("assets/file/cv.pdf");
            }
        }]);