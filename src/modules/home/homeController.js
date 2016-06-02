angular.module("personalWeb").controller("homeController",
    ["$sce",
        function ($sce) {

            var personalText = "I am a web-developer, still a recent college grad, a math enthusiast " +
                "and an art lover. I graduated from Oberlin College with Computer Science and Mathematics " +
                "major, then moved to Istanbul and started working at Monitise MEA (Pozitron as it used " +
                "to be called). More information about my educational background can be found in my resume." +
                " As for work, I have been mostly working on <a href=\"https://mobile.flypgs.com/#/checkin/search\">" +
                "Pegasus Airlines' mobile website </a>";

            var links = "Here are links to: </br>" +
                "<a href=\"https://github.com/SinemSemsioglu\">My Github Page</a></br>" +
                "<a href=\"https://tr.linkedin.com/in/sinemsemsioglu\">My LinkedIn Page </a>";

            this.text = {
                navItems: {
                    portfolio: "Portfolio",
                    resume: "Resume"
                },
                temp: {
                    temporary: "TEMPORARY",
                    website: "WEBSITE"
                },
                about: [$sce.trustAsHtml(personalText), $sce.trustAsHtml(links)],
                name: {
                    first: "Sinem",
                    last: "Semsioglu"
                }
            };

            this.openCv = function () {
                window.open("assets/file/cv.pdf");
            };

            this.navigateToPortfolio = function () {
                window.location = ("portfolio.html");
            };
        }]);