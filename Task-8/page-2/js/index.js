function button_1(){
  localStorage.setItem("Something");
}

function button_2() {
var t_date = new Date();
var hour = t_date.getHours();
var minute = t_date.getMinutes();
var second = t_date.getSeconds();
var current_time = "Time : " +hour + " : " + minute + " : " + second;

alert(current_time);      
}

function button_3() { 
var background_list = ["url('http://www.justinmaller.com/img/projects/wallpaper/WP_Daft_Punk-2560x1440_00000.jpg')","url('http://www.justinmaller.com/img/projects/wallpaper/WP_Cosmos_Knight-2560x1440_00000.jpg')","url('http://www.justinmaller.com/img/projects/wallpaper/WP_Dark_Lord-2560x1440_00228.jpg')","url('http://www.justinmaller.com/img/projects/wallpaper/WP_Scan_Complete-2560x1440_00000.jpg')"];
var background_img = background_list[Math.floor(Math.random()*background_list.length)];
document.body.style.background = background_img;
document.body.style.backgroundSize ="cover";
 
}
function button_6(){
for (var i = 1; i <= 500; i++) {
console.log("I did it");
}
}