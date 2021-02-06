document.querySelector("#grid").addEventListener("click",()=>{
    if( document.querySelector("#grid").classList.contains('unclicked'))
    {
        document.getElementById("grid").classList.remove('unclicked');
        document.getElementById("grid").classList.add('clicked');
        document.getElementById("list").classList.remove('clicked');
        document.getElementById("list").classList.add('unclicked');
        document.getElementById("projects").style.display="flex";
        document.getElementById("projectsList").style.display="none";
        
    }
});
document.querySelector("#list").addEventListener("click",()=>{
    if( document.querySelector("#list").classList.contains('unclicked'))
    {
        document.getElementById("list").classList.remove('unclicked');
        document.getElementById("list").classList.add('clicked');
        document.getElementById("grid").classList.remove('clicked');
        document.getElementById("grid").classList.add('unclicked');
        document.getElementById("projects").style.display="none";
        document.getElementById("projectsList").style.display="flex";
    }
});
document.querySelector('#hide1').addEventListener("click",()=>{
    var style = document.querySelector('#SectionBody1').style;
    var style1 = document.querySelector('#hide1').style
    if(style.display=="none"){
        style.display="block";
        style1.transform= "rotate(0deg)";
    }else{
        style.display="none";
        style1.transform= "rotate(180deg)";
    }

});
document.querySelector('#hide2').addEventListener("click",()=>{
    var style = document.querySelector('#SectionBody2').style;
    var style1 = document.querySelector('#hide2').style
    if(style.display=="none"){
        style.display="block";
        style1.transform= "rotate(0deg)";
    }else{
        style.display="none";
        style1.transform= "rotate(180deg)";
    }
});
document.querySelector('#hide3').addEventListener("click",()=>{
    var style = document.querySelector('#SectionBody3').style;
    var style1 = document.querySelector('#hide3').style
    if(style.display=="none"){
        style.display="block";
        style1.transform= "rotate(0deg)";
    }else{
        style.display="none";
        style1.transform= "rotate(180deg)";
    }
});
document.querySelector('#hide4').addEventListener("click",()=>{
    var style = document.querySelector('#SectionBody4').style;
    var style1 = document.querySelector('#hide4').style
    if(style.display=="none"){
        style.display="block";
        style1.transform= "rotate(0deg)";
    }else{
        style.display="none";
        style1.transform= "rotate(180deg)";
    }
});
document.querySelectorAll(".field").forEach((element)=>{
element.addEventListener("click",()=>{
    var id = element.id;
    id="#"+id;
    var svgid=id+"SVG";
    console.log(id);
    console.log(svgid);
    if(document.querySelector(id).checked){
        document.querySelector(svgid).classList.remove("unchecked");
    }else{
        document.querySelector(svgid).classList.add("unchecked");
    }
});
});
