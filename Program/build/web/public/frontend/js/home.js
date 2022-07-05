/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const wrapper = document.querySelector(".wrapper");
const searchBox = document.getElementById("search-box");
const allElement = document.getElementsByTagName("*");

/** @type HTMLElement|null */
let focusedElement = null;

const focusElement = (element) => {
    if (focusedElement) focusedElement.classList.remove('focussed');
    focusedElement = element;
    focusedElement.classList.add('focussed');
}

const unfocusElement = () => {
    if (!focusedElement) return;
    focusedElement.classList.remove('focussed');
    focusedElement = null;
    hideContainers();
}

document.addEventListener("click", (evt) => {
    if (!focusedElement) return;
    let targetEl = evt.target; // clicked element
    do {
        if(targetEl === focusedElement) {
            return;
        }
        // Go up the DOM
        targetEl = targetEl.parentNode;
    } while (targetEl);
    // This is a click outside.
    unfocusElement();
});

document.querySelectorAll('.focusable').forEach(value => {
    value.addEventListener("click", (ev) => {
        ev.stopPropagation();
        focusElement(value);
    })
})

document.getElementById('trigger-login').addEventListener('click', (ev) => {
    ev.stopPropagation();
    focusElement(loginPanel);
})



// var unfocused = new Array();
// unfocused.push(document.querySelector(".slideshow-background"));
// unfocused.push(document.querySelector(".main-background"));
// unfocused.push(document.querySelector("footer"));
// let hasListener = false;
//
// navLogin.addEventListener("click", navLoginClicked);
//
// function navLoginClicked() {
//     if (hasListener) {
//         for (var i = 0; i < unfocused.length; i++) {
//             unfocused[i].removeEventListener("clicked", unfocusPanels);
//         }
//         hasListener = false;
//     }
//     if (searchBox.classList.contains("active")) {
//         for (var i = 0; i < unfocused.length; i++) {
//             if (unfocused[i] == wrapper) {
//                 unfocused[i].style.filter = "brightness(1)";
//             }
//         }
//     }
//
//     unfocused.splice(3,1);
//     unfocused.push(document.querySelector("#search-box"));
//     for (var i = 0; i < unfocused.length; i++) {
//         unfocused[i].style.filter = "brightness(0.5)";
//     }
//
//     loginPanel.style.display = "block";
//     console.log("loginPanel");
//     console.log(loginPanel.style.display);
//     focusOnClicked();
// }
//
// searchBox.addEventListener("click", searchBoxClicked);
//
// function searchBoxClicked() {
//     if (hasListener) {
//         for (var i = 0; i < unfocused.length; i++) {
//             unfocused[i].removeEventListener("clicked", unfocusPanels);
//         }
//         hasListener = false;
//     }
//     if (loginPanel.style.display == "block") {
//         for (var i = 0; i < unfocused.length; i++) {
//             if (unfocused[i] == document.querySelector("#search-box")) {
//                 unfocused[i].style.filter = "brightness(1)";
//             }
//         }
//         unfocused.splice(3,2);
//         if (!unfocused.includes(wrapper)) {
//             unfocused.push(wrapper);
//         }
//         for (var i = 0; i < unfocused.length; i++) {
//             unfocused[i].style.filter = "brightness(0.5)";
//         }
//     }
//     if (!unfocused.includes(wrapper)) {
//         unfocused.push(wrapper);
//     }
//
//
//     if (!searchBox.classList.contains("active")) {
//         if (navLogin.classList.contains("active")) {
//             navLogin.classList.remove("active");
//         }
//         searchBox.classList.add("active");
//         console.log("searchBox");
//         console.log(searchBox.classList);
//         focusOnClicked();
//     }
// }
//
// function focusOnClicked() {
//     for (var i = 0; i < unfocused.length; i++) {
//         unfocused[i].style.filter = "brightness(0.5)";
//
//         if (!hasListener) {
//             unfocused[i].addEventListener("click", unfocusPanels);
//             hasListener = true;
//         }
//     }
// }
//
// function unfocusPanels() {
//     if (searchBox.classList.contains("active")) {
//         searchBox.classList.remove("active");
//         console.log(unfocused);
//         for (var j = 0; j < unfocused.length; j++) {
//             unfocused[j].style.filter = "brightness(1)";
//             hideContainers();
//         }
//         console.log("searchBox");
//         console.log(searchBox.classList);
//     }
//     else if (loginPanel.style.display == "block") {
//         loginPanel.style.display = "none";
//         for (var j = 0; j < unfocused.length; j++) {
//             unfocused[j].style.filter = "brightness(1)";
//         }
//         console.log("loginPanel");
//         console.log(loginPanel.style.display);
//     }
//     unfocused.splice(3,2);
//     for (var i = 0; i < unfocused.length; i++) {
//         unfocused[i].removeEventListener("clicked", unfocusPanels);
//     }
//     hasListener = false;
// }
//
// // masalahnya adalah ketika style.filter = brightness() sudah berjalan, style.display tidak berjalan????????? ADA APA DENGAN JAVASCRIPT?!?!?!?!!?!

var fromContainer = document.getElementById("from-city-list");
var toContainer = document.getElementById("to-city-list");
var passContainer = document.getElementById("passenger-list");

function displayListsFrom() {
    fromContainer.style.display = "block";
    document.getElementsByTagName("*").onclick = function() {
        if (fromContainer.style.display == "block") {
            fromContainer.style.display = "none";
        }
        if (toContainer.style.display == "block") {
            toContainer.style.display = "none";
        }
        if (passContainer.style.display == "block") {
            passContainer.style.display = "none";
        }
        console.log("blah")
    }
}
function displayListsTo() {
    toContainer.style.display = "block";
}
function displayListsPass() {
    passContainer.style.display = "block";
}

var btnFromCity = document.querySelectorAll('.btn-cities-from');
var btnToCity = document.querySelectorAll(".btn-cities-to");
var departDate = document.getElementById("departure-date");
var returnDate = document.getElementById("return-date");

btnFromCity.forEach(button => {
    button.addEventListener("click", function() {
        document.getElementById("from-city").value = button.innerHTML;
        fromContainer.style.display = "none";
        if (document.getElementById("to-city").value == "") {
            displayListsTo();
        }
        else {
            departDate.click;
        }
    });
})
btnToCity.forEach(button => {
    button.addEventListener("click", function() {
        document.getElementById("to-city").value = button.innerHTML;
        toContainer.style.display = "none";
        if (document.getElementById("from-city").value == "") {
            displayListsFrom();
            console.log(document.getElementById("departure-date"))
        }
        else {
            departDate.click;
            console.log(departDate);
        }
    })
})

departDate.valueAsDate = new Date();
// setup for return date
var date = new Date();
var day = date.getDate() + 1;
var month = date.getMonth() + 1;
var year = date.getFullYear();

if (month < 10) {
    month = "0" + month;
}
if (day < 10) {
    day = "0" + day;
}
var tomorrow = year + "-" + month + "-" + day;
returnDate.value = tomorrow;

// slideshow
const image = ["public/frontend/images/Airline_ads(1).jpg", "public/frontend/images/Airline_ads(2).jpg", "public/frontend/images/Airline_ads(3).jpg", "public/frontend/images/Airline_ads(4).jpg", "public/frontend/images/Airline_ads(5).jpg"];
var slideImg = document.getElementsByClassName("slideshow-img");
var slide1 = 0;
var slide2 = 1;
var slide3 = 2;

function slideshowAds() {
    if (slide3 > (image.length - 1)) {
        slide3 = 0;
    }
    if (slide2 > (image.length - 1)) {
        slide2 = 0;
    }
    if (slide1 > (image.length - 1)) {
        slide1 = 0;
    }

    slideImg[0].src = image[slide1];
    slideImg[1].src = image[slide2];
    slideImg[2].src = image[slide3];
    slide1++;
    slide2++;
    slide3++;
    setTimeout(slideshowAds, 3000);
}

slideshowAds();

// return date checked
function returnFlight() {
    if (document.getElementById("return-date-check").checked) {
        returnDate.disabled = false;
        if (returnDate.value != tomorrow) {
            displayListsPass();
        }
    }
    else {
        returnDate.disabled = true;
    }
}

var passCount = 1;
var seatClass = "Economy";
var textGroup;

btnDecrease = document.getElementById("passenger-count").querySelectorAll(".btn-decrease");
btnIncrease = document.getElementById("passenger-count").querySelectorAll(".btn-increase");

btnDecrease.forEach(button => {
    button.addEventListener("click", function() {
        if (passCount > 1) {
            passCount--;
            if (passCount == 1) {
                textGroup = passCount + " Passenger, " + seatClass;
            }
            else {
                textGroup = passCount + " Passengers, " + seatClass;
            }
            document.getElementById("passenger-seat-class").value = textGroup;
        }
    })
})
btnIncrease.forEach(button => {
    button.addEventListener("click", function() {
        if (passCount < 5) {
            passCount++;
            textGroup = passCount + " Passengers, " + seatClass;
        }
        document.getElementById("passenger-seat-class").value = textGroup;
    })
})

btnSeatClass = document.querySelectorAll(".seat-class-list");

btnSeatClass.forEach(button => {
    button.addEventListener("click", function() {
        seatClass = button.innerHTML;
        if (passCount == 1) {
            textGroup = passCount + " Passenger, " + seatClass;
        }
        else {
            textGroup = passCount + " Passengers, " + seatClass;
        }
        document.getElementById("passenger-seat-class").value = textGroup;
    })
})

function resetPassSeatClass() {
    passCount = 1;
    seatClass = "Economy";
    document.getElementById("passenger-seat-class").value = "1 Passenger, Economy";
}

function submitPassSeatClass() {
    passContainer.style.display = "none";
}

// Konsul 1
function hideContainers() {
    if (fromContainer.style.display == "block") {
        fromContainer.style.display = "none";
    }
    if (toContainer.style.display == "block") {
        toContainer.style.display = "none";
    }
    if (passContainer.style.display == "block") {
        passContainer.style.display = "none";
    }
}