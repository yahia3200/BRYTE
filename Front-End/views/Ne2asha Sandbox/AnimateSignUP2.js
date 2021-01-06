
window.onload = (event) => {
    gsap.to(".signUP-form-Cont-2 .Input-Cont, #Complete-dev", { delay: 0.4, duration: 0.4, y:-80, opacity: 1, stagger: 0.1});
    document.querySelector(".signUP-form-Cont-2").style.pointerEvents = 'all';
    gsap.to("circle", { duration: 0.5, fill: '#4B90F7'});
    document.querySelector(".TitleAbove").innerHTML = "Personal Info";
};