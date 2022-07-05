/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const burger = document.querySelector('.burger');
const sidebar = document.querySelector('.sidebar');
const bgSidebar = document.querySelector('.bg-sidebar');

burger.addEventListener('click', function() {
    this.classList.toggle('change');
    sidebar.classList.toggle('change');
    bgSidebar.classList.toggle('change');
});

bgSidebar.addEventListener('click', function() {
    this.classList.remove('change');
    sidebar.classList.remove('change');
    burger.classList.remove('change');
});

const navLogin = document.getElementById("nav-login");
const loginPanel = document.getElementById("login-panel");

function extendLogin() {
    if (loginPanel.style.display === "block") {
        loginPanel.style.display = "none";
    }
    else {
        loginPanel.style.display = "block";
    }
}