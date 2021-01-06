document.querySelector("#sign-up-dev").addEventListener("click", ()=> {
    gsap.to("#sep1", { duration: 0.7, x: 55, y: -200, opacity: 0 });
    gsap.to("#sep2", { duration: 0.7, x: -55, y: 200, opacity: 0 });
    gsap.to(".Cont-Block.cli", { duration: 0.7, x: 500, opacity: 0 });
    gsap.to(`#${event.target.id}`, { duration: 0.1, y: 20, opacity: 0 });
    gsap.to(".Cont-Block.dev", { delay: 0.5, duration: 1, x: 840, y: 40 });
    gsap.to(".signUP-form-Cont-1", { delay: 1, duration: 0.4, y: -80});
    gsap.to(".signUP-form-Cont-1 .Input-Cont, #Complete-dev", { delay: 1, duration: 0.4, y:-80, opacity: 1, stagger: 0.1});
    gsap.to(".UnderLineTitle", { delay: 1, duration: 0.3, x:80, opacity: 1});
    document.querySelector(".signUP-form-Cont-1").style.pointerEvents = 'all';
  });
document.querySelector("#form").addEventListener("submit", (e)=>{
  e.preventDefault();
  gsap.to(".signUP-form-Cont-1", { delay: 0, duration: 0.4, y: 80});
  gsap.to(".signUP-form-Cont-1 .Input-Cont, #Continue-dev", { delay: 0, duration: 0.4, y:80, opacity: 0});
  document.querySelector(".signUP-form-Cont-1").style.pointerEvents = 'none';
});