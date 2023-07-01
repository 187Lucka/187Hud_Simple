$("html").hide();

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var edata = event.data;
        if (edata.type === "show") {
            if (edata.status == true) {
                heal = edata.heal;
                armor = edata.armor;
                thirst = edata.thirst;
                hunger = edata.hunger;

                if (heal == 100) {
                    $("#circle1").fadeOut();
                } else {
                    document.querySelectorAll('#circle1').forEach((a) => {
                        a.style.setProperty('--heal', `calc(154 - (154 * ${edata.heal}) / 100)`);
                    });
                    $("#circle1").fadeIn();
                }

                if (armor == 0) {
                    $("#circle2").fadeOut();
                } else {
                    document.querySelectorAll('#circle2').forEach((a) => {
                        a.style.setProperty('--armor', `calc(154 - (154 * ${edata.armor}) / 100)`);
                    });

                    $("#circle2").fadeIn();
                }

                if (hunger < 80) {
                    document.querySelectorAll('#circle3').forEach((a) => {
                        a.style.setProperty('--hunger', `calc(154 - (154 * ${edata.hunger}) / 100)`);
                    });
                    $("#circle3").fadeIn();
                } else {
                    $("#circle3").fadeOut();
                }

                if (thirst < 80) {
                    document.querySelectorAll('#circle4').forEach((a) => {
                        a.style.setProperty('--thirst', `calc(154 - (154 * ${edata.thirst}) / 100)`);
                    });
                    $("#circle4").fadeIn();
                } else {
                    $("#circle4").fadeOut();
                }

                $("html").fadeIn();
                $("html").show();
            } 
        }
        if (edata.type === "hide") {
            $("html").fadeOut();
            $("html").hide();
        }
    })
});